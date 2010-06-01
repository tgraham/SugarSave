class ResetMailer < ActionMailer::Base
  default :from => "SugarSave <mailer@sugarsave.com>"
  
  def reset_email(user)
    @user = user
    @url  = edit_password_reset_url(user.perishable_token)
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "SugarSave password reset instructions.")
  end
end
