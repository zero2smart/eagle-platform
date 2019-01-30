module API
  class Dispatch < Grape::API
    require 'action_dispatch/middleware/remote_ip.rb'
    use ActionDispatch::RemoteIp

    mount API::V1::Base
    if %w(development staging).include? Rails.env
      add_swagger_documentation base_path: "",
                                # add_base_path: true,
                                api_version: 'v1',
                                hide_format: false,
                                format: :json,
                                hide_documentation_path: true
    end    
  end

  class Logger < Grape::Middleware::Base
    
    def before
      Rails.logger.info "[api] Requested: #{parsePW request_log_data.to_json}"
    end

    def after
      Rails.logger.info "[api] Response: #{parsePW response_log_data}"
    end
    
    private

      def request_log_data
        req = Rack::Request.new(env)

        request_data = {
          method: env['REQUEST_METHOD'],
          path:   env['PATH_INFO'],
          token: env['HTTP_X_AUTH_TOKEN'],
          data: req.POST
        }
        request_data[:user_id] = current_user.id if (current_user rescue false)
        request_data
      end

      def response_log_data
        # status, headers, bodies = *@app_response
        # body = @app.call(env)[2]
        # body = body.body if body.kind_of? Rack::BodyProxy
        # body.first if body.kind_of? Array
      end

      def parsePW(data)
        begin
          json = JSON.parse data
          json["data"]["password"] = "HIDDEN" if (json["data"] && json["data"]["password"])
          json
        rescue => e
          data
        end
      end

  end

  Base = Rack::Builder.new do
    use API::Logger
    run API::Dispatch
  end

  def self.routes
    API::V3::Base.routes.each do |route|
      info = route.instance_variable_get :@options
      description = "%-40s..." % info[:description][0..39]
      method = "%-7s" % info[:method]
      puts "#{description}  #{method}#{info[:path]}"
    end
  end
end
