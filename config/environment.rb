# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
BodyAndMind::Application.initialize!

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'collaborateur.app@gmail.com',
    password:             'green394',
    authentication:       'plain',
    enable_starttls_auto: true  }