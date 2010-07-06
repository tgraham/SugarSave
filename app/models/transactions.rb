require 'active_merchant'

class Transactions < ActiveRecord::Base
  include ActiveMerchant::Billing
  include ActiveMerchant::Utils

  belongs_to :invoice

  def process
    @gateway = get_payment_gateway

    response = @gateway.create_customer_profile_transaction({:transaction => {:type => :auth_capture,
                                                             :amount => self.invoice.amount.to_s,
                                                             :customer_profile_id => self.invoice.user.customer_cim_id,
                                                             :customer_payment_profile_id => self.invoice.user.payment_profile.payment_cim_id}})
    puts response.inspect
    if response.success? and response.authorization
      update_attributes({:confirmation_id => response.authorization})
      return true
    else
      update_attributes({:error => !response.success?,
                         :error_code => response.params['messages']['message']['code'],
                         :error_message => response.params['messages']['message']['text']})
      return false
    end
  end
end
