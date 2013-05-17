require 'json'
#require 'rack/ssl'
class WebservicesLib

  def initialize(app)
    @app = app
    @keyword = "api"
  end

  include ActiveSupport::Rescuable

  def call(env)
    begin
      @req = Rack::Request.new(env)
      if not_match_url?(@req.url)
        @app.call(env)
      elsif bad_request?(@req)
        #bad_request_response
      else
        if @req.get?
          get_response
        else
          post_response
        end
      end
    # rescue Exception => e
    #   puts e.message
    #   bad_request_response
    end
  end

  def bad_request_response
    @res = Rack::Response.new
    message = WsJsonLib.format_messages(nil,"405",nil)
    @res.write(message)
    @res.finish
  end

  def bad_request?(req)
    !(req.get? || req.post?)
  end

  def not_match_url?(url)
    !url.include? @keyword
  end

  def post_response
    @res = Rack::Response.new
    case @req.path
      # Check login and password and return api_key when is true
      when '/api/auth'
        out = auth_user(@req.params['login'], @req.params['password'])
        @res.write out
      when '/api/device_auth'
        out = auth_device(@req.params['serial_number'], @req.params['pin'], @req.params['udi'])
        @res.write out
      else
        if WsSecurityLib::Auth.check_api_key(@req.params['api_key'])
          case @req.path
            when "/api/push"
              resp = insert_device_data(@req.params['longitude'], @req.params['latitude'], @req.params['api_key'], @req.params['variables'])
            else
              resp = WsJsonLib.format_messages(nil,"404",nil)
          end
        else
          resp = WsJsonLib.format_messages(nil,"401",nil)
        end
        @res.write(resp)
    end
    @res.finish
  end

  # Manage all get petition to API
  #
  def get_response
    @res = Rack::Response.new
    api_key = @req.params['api_key']
    if WsSecurityLib::Auth.check_api_key(api_key)
      case @req.path
        when "/qryr" 
          resp = qryr(api_key, @req.params['confirmation_nm'])
        else
          resp = WsJsonLib.format_messages(nil,"404",nil)
      end
    else
      resp = WsJsonLib.format_messages(nil,"401",nil)
    end
    @res.write(resp)
    @res.finish
  end

  private

  def auth_user(login, password)
    user = WsSecurityLib::Auth.authenticate(login, password)
    if user
      api_key = WsSecurityLib::Auth.get_api_key(user)
      data = {:login => login, :api_key => api_key}
      resp = WsJsonLib.format_messages(data,"200","auth")
    else
      resp = WsJsonLib.format_messages(nil,"401",nil)
    end
    resp
  end

  def auth_device(serial_number, pin, udi)
    device = WsSecurityLib::Auth.authenticate_device(serial_number, pin)
    if device
      api_key = WsSecurityLib::Auth.get_device_api_key(device, udi)
      data = {:api_key => api_key}
      resp = WsJsonLib.format_messages(data,"200","auth_device")
    else
      resp = WsJsonLib.format_messages(nil,"401",nil)
    end
    resp
  end

  def insert_device_data(longitude, latitude, api_key, variables)
    apikey = ApiKey.find_by_key api_key
    collected_measurement = apikey.device.collected_measurements.new(:longitude => longitude, :latitude => latitude)
    collected_measurement.traced_route_id = apikey.device.traced_routes.last.id unless apikey.device.traced_routes.blank? || apikey.device.traced_routes.last.state == "finished"
   
    if collected_measurement.save(:validate => false)
      collected_measurement.traced_route.track unless collected_measurement.traced_route_id.nil?
      data = {:saved => true}
    else
      data = {:saved => false}
    end
    WsJsonLib.format_messages(data,"200","push")
  end


end