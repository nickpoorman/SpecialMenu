class UserMailer < ActionMailer::Base
  default from: "register@zapwire.me"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/users/#{user.activation_token}/activate"
    #@greeting = "Hi"

    mail( :to => user.email,
          :subject => "Welcome to ZapWire.me") 
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
    @user = user
    @url = "http://0.0.0.0:3000/login"
    #@greeting = "Hi"

    #mail to: "to@example.org"
    mail(:to => user.email,
         :subject => "Your account is now activated")
  end
end
