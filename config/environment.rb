# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sugar::Application.initialize!

module ActiveMerchant
  module Utils
    def get_payment_gateway
      ActiveMerchant::Billing::Base.mode = :test
      
      gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
        :login => 'LOGIN_INFO',
        :password => 'PASSWORD_INFO'
      )
      
      if not gateway
        raise AuthenticationFailed, 'Authentication with CIM Gateway could not be completed.'
      end

      return gateway
    end
  end
end
