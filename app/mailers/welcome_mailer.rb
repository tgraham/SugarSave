class WelcomeMailer < ActionMailer::Base
  default :from => "SugarSave <mailer@sugarsave.com>"
  
  def welcome_email(user)
    @user = user
    @url  = "http://sugarsave.com/login"
    mail( :to => "#{user.first_name+' '+user.last_name} <#{user.email}>",
          :subject => "Welcome to SugarSave")
  end
end
