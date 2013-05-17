require "json"
class WsJsonLib
  class << self
    VERSION = "1.1"
    NAME = "praig.com/api"

    def format_messages(data,code,function=nil)
      if !function.nil?
        case function
          when "auth"
            resp = common_messages("ok","200")
            resp["method"] = "POST"
            resp["data"] = {"login" => data[:login], "api_key" => data[:api_key]}
            resp.to_json          
          when "auth_device"
            resp = common_messages("ok","200")
            resp["method"] = "POST"
            resp["data"] = {"api_key" => data[:api_key]}
            resp.to_json
          when "push"
            resp = common_messages("ok","200")
            resp["method"] = "POST"
            resp["data"] = {"received" => data[:saved]}
            resp.to_json
        end
      else
        case code
          when "400"
            resp = common_messages("fail","400")
            resp["error"]= {"description" => "Bad Request"}
            resp.to_json
          when "401"
            resp = common_messages("fail","401")
            resp["error"]= {"description" => "Authentication Failed"}
            resp.to_json
          when "404"
            resp = common_messages("fail","404")
            resp["error"]= {"description" => "Not Found URL"}
            resp.to_json
          when "405"
            resp = common_messages("fail","405")
            resp["error"]= {"description" => "Method Not Allowed"}
            resp.to_json
          else
            resp = common_messages("fail","404")
            resp["error"]= {"description" => "Not Found URL"}
            resp.to_json
        end
      end
    end

    private
    def common_messages(status, code)
      {"date" => Time.now.strftime('%m-%d-%Y %H:%m%p'), "name" => NAME, "version" => VERSION, "status" => status, "code" => code, "mediaType" => "application/json"}
    end
  end
end
