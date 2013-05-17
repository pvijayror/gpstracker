module WsSecurityLib
  class Auth
    class << self

      def initialize()
      end

      def authenticate_device(serial_number, pin)
        device = Device.find_for_authentication(serial_number)
        unless device.blank?
          if device.valid_pin?(pin)
            device
          else
            false
          end
        else
          false
        end
      end

      def authenticate(email,password)
        user = User.find_for_authentication(:email => email)
        unless user.blank?
          if user.valid_password?(password)
            user
          else
            false
          end
        else
          false
        end
      end

      def get_api_key(user)
        api_key = Base64.urlsafe_encode64("{:user=>#{user.id.to_s},:email=>'#{user.email}',:date=>'#{Time.now}'}" )
        ApiKey.create(:user_id => user.id, :key => api_key, :email => user.email, :expiry_date => (Time.now + 2.hours))
        api_key
      end

      def get_device_api_key(device, udi)
        api_key = Base64.urlsafe_encode64("{:device=>#{device.id.to_s},:serial_number=>'#{device.serial_number}', :udi=>'#{udi}',:date=>'#{Time.now}'}" )
        ApiKey.create(:device_id => device.id, :key => api_key, :serial_number => device.serial_number, :udi => udi, :expiry_date => nil)
        api_key
      end

      def check_api_key(apikey)
        result = false
        api_key = ApiKey.find_by_key(apikey)
        unless api_key.nil?
          result = true if api_key_expirate?(api_key)
        end
        result
      end

      def get_key(api_key)
        api_key = ApiKey.find_by_key(api_key)
      end

      private

      def api_key_expirate?(api_key)
        unless api_key.expiry_date.nil?
          ((api_key.expiry_date.to_time - Time.now) > 0) ? true : false
        else
          api_key.udi.nil? ? false : true
        end
      end
    end
  end
end
