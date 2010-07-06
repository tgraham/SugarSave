# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Sugar::Application.initialize!

module ActiveMerchant
  module Utils
    def get_payment_gateway
      ActiveMerchant::Billing::Base.mode = :test
      
      gateway = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
        :login => '3E3tZxqAd723',
        :password => '4f22xmNX7sU8L2va'
      )
      
      if not gateway
        raise AuthenticationFailed, 'Authentication with CIM Gateway could not be completed.'
      end

      return gateway
    end
  end
end