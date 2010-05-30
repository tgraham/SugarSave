class ResetMailer < ActionMailer::Base
  default :from => "mailer@sugarsave.com"
  
  def reset_email(user)
    @user = user
    @url  = edit_password_reset_url(user.perishable_token)
    mail( :from => "SugarSave",
          :to => user.email,
          :subject => "SugarSave password reset instructions.")
  end
end
