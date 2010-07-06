require 'active_merchant'

class User < ActiveRecord::Base
  include ActiveMerchant::Utils
  
  acts_as_authentic
  is_gravtastic
  
  # has_many :invoices, :dependent => :destroy
  belongs_to :payment_profiles, :dependent => :destroy
  belongs_to :city
  
  attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation, :city_id, :role,
                  :customer_cim_id, :payment_profile_id
  
  validates :first_name, :last_name, :presence => true
  
  ROLES = %w[admin metro]
  
  def full_name(user)
    user.first_name+' '+user.last_name
  end
  
  def deliver_reset_email!
    reset_perishable_token!
    NotifierMailer.reset_email(self).deliver
  end
  
  #Override ActiveRecord create to add in create_cim_profile
  def create
    if super and create_cim_profile
      #return true if both the user and the CIM profile was created successfully
      return true
    else
      if self.id
        #destroy the instance if it was created
        self.destroy
      end
      return false
    end
  end

  #Override ActiveRecord update to add in update_cim_profile
  def update
    if super and update_cim_profile
      return true
    end
    
    return false
  end

  #Override ActiveRecord destroy to add in delete_cim_profile
  def destroy
    if delete_cim_profile and super
      return true
    end

    return false
  end

  private
  def create_cim_profile
    #Login to the gateway using your credentials in environment.rb
    @gateway = get_payment_gateway

    #setup the user object to save
    @user = {:profile => user_profile}
    
    #send the create message to the gateway API
    response = @gateway.create_customer_profile(@user)
    
    if response.success? and response.authorization
      update_attributes({:customer_cim_id => response.authorization})
      
      return true
    end
    
    return false
  end

  def update_cim_profile
    if not self.customer_cim_id

      return false
    end

    @gateway = get_payment_gateway
    response = @gateway.update_customer_profile(:profile => user_profile.merge({
      :customer_profile_id => self.customer_cim_id
    }))

    if response.success?

      return true
    end

    return false
  end

  def delete_cim_profile
    if not self.customer_cim_id
      return false
    end
    
    @gateway = get_payment_gateway
    response = @gateway.delete_customer_profile(:customer_profile_id => self.customer_cim_id)

    if response.success?
      return true
    end
    
    return false
  end
  
  def user_profile
    return {:merchant_customer_id => self.id, :email => self.email, :description => self.username}
  end
  
end
