# Load the Rails application.
require_relative "application"

ActionMailer::Base.smtp_settings = {
    address:             'smtp.gmail.com',
    port:                 587,
    domain:              'gmail.com',
    user_name:           ENV['SEND_MAIL'],
    password:            ENV['SEND_MAIL_PASSWORD'],
    authentication:      'plain',
    enable_starttls_auto: true
}

# Initialize the Rails application.
Rails.application.initialize!
