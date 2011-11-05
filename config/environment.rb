# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Zapwire::Application.initialize!

#ActionMailer::Base.smtp_settings = {
#  :user_name => "poorman",
#  :password => "laurensummer2011",
#  :domain => "zapwire.me",
#  :address => "smtp.sendgrid.net",
#  :port => 587,
#  :authentication => :plain,
#  :enable_starttls_auto => true
#}
