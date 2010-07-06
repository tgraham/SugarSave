require 'active_merchant'

class PaymentProfile < ActiveRecord::Base
  include ActiveMerchant::Billing
  include ActiveMerchant::Utils
  
  belongs_to :user

  attr_accessor :customer_cim_id
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :address
  attr_accessor :country
  attr_accessor :state
  attr_accessor :city
  attr_accessor :zip
  attr_accessor :number
  attr_accessor :cvv
  attr_accessor :month
  attr_accessor :year
  
  COUNTRIES = ["United States"]
  
  validates :customer_cim_id, :first_name, :last_name, :address, :country, :state, :city, :zip, :number, :cvv, :month, :year, :presence => true
  validates :customer_cim_id, :number, :cvv, :month, :year, :zip, :numericality => true
  
  def create
    if super and create_payment_profile
      user.update_attributes({:payment_profile_id => self.id})
      
      return true
    else
      if self.id
        #destroy the instance if it was created
        self.destroy
      end

      return false
    end
  end

  def update
    if super and update_payment_profile
      return true
    end
    
    return false
  end

  def destroy
    if delete_payment_profile and super
      return true
    end
    
    return false
  end

  private
  
  def card
    card = ActiveMerchant::Billing::CreditCard.new(
          :first_name => self.first_name,
          :last_name => self.last_name,
          # Test Number 4222222222222222
          :number => self.number,
          :month => self.month,
          :year => self.year,
          :verification_value => self.cvv
        )
  end
  
  def create_payment_profile
  #  if not self.payment_cim_id

  #    return false
  #  end
    logger.info "############## #{self.inspect} ############ #{@self.user.inspect} #################"
  
    @gateway = get_payment_gateway

    @profile = {  :customer_profile_id => self.user.customer_cim_id,
                  :payment_profile => { :bill_to => { :first_name => self.first_name,
                                                      :last_name  => self.last_name,
                                                      :address    => self.address,
                                                      :country    => self.country,
                                                      :state      => self.state,
                                                      :city       => self.city,
                                                      :zip        => self.zip },
                                        :payment => { :credit_card => card }
                                      }
                }
    
    response = @gateway.create_customer_payment_profile(@profile)

    if response.success? and response.params['customer_payment_profile_id']
      update_attributes({:payment_cim_id => response.params['customer_payment_profile_id']})

      self.address = {}
      self.number = {}
      return true
    end

    return false
  end
  
  def update_payment_profile
    @gateway = get_payment_gateway

    @profile = {  :customer_profile_id => self.user.customer_cim_id,
                  :payment_profile => {   :customer_payment_profile_id => self.payment_cim_id,
                                          :bill_to => { :first_name => self.first_name,
                                                        :last_name  => self.last_name,
                                                        :address    => self.address,
                                                        :country    => 'US',
                                                        :state      => self.state,
                                                        :city       => self.city,
                                                        :zip        => self.zip },
                                          :payment => {:credit_card => card }
                                       }
                }

    response = @gateway.update_customer_payment_profile(@profile)

    if response.success?
      self.address = {}
      self.number = {}

      return true
    end

    return false
  end

  def delete_payment_profile
    @gateway = get_payment_gateway

    response = @gateway.delete_customer_payment_profile(  :customer_profile_id => self.user.customer_cim_id,
                                                          :customer_payment_profile_id => self.payment_cim_id)

    if response.success?
      self.user.update_attributes({:payment_profile_id => nil})
      
      return true
    end

    return false
  end

end
