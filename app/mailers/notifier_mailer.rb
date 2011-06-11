class NotifierMailer < ActionMailer::Base
  default :from => "SugarSave <mailer@domain.com>"
  default :to => "User <user@domain.com>"
  
  def recommendation_email(recommendation)
    @recommendation = recommendation
    
    mail( :from => "#{recommendation.name} <#{recommendation.from_email}>",
          :reply_to => "#{recommendation.name} <#{recommendation.from_email}>",
          :to => "#{recommendation.to_email}",
          :subject => "#{recommendation.subject}")
  end
  
  def reset_email(user)
    @user = user
    @url  = edit_password_reset_url(user.perishable_token)
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "SugarSave password reset instructions.")
  end
  
  def welcome_email(user)
    @user = user
    @url  = "http://sugarsave.com/login"
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "Welcome to SugarSave")
  end
  
  def contact_email(contact)
    @contact = contact
    
    mail( :from => "Contact Us <#{contact.from_email}>",
          :reply_to => "#{contact.from_email}",
          :subject => "SugarSave Contact Us Submission")
  end
end
