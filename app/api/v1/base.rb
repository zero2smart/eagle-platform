module API
  module V1
    class Base < Grape::API
      require 'rollbar'

      include API::V1::Utils::APIKey
      include API::V1::Utils::Defaults
      include API::V1::Utils::Responders
      include API::V1::Utils::ErrorHandlers
      
      # Load all Non-Authenticated Endpoints
      mount API::V1::Endpoints::Public::Base

      # Load all Authenticated Endpoints
      mount API::V1::Endpoints::Authenticated::Base
    end
  end
end