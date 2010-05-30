class WelcomeMailer < ActionMailer::Base
  default :from => "mailer@sugarsave.com"
  
  def welcome_email(user)
    @user = user
    @url  = "http://sugarsave.com/login"
    mail( :from => "SugarSave",
          :to => user.email,
          :subject => "Welcome to SugarSave")
  end
end
