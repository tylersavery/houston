from project.settings.environment import ENV

# Twilio
# https://www.twilio.com/docs

TWILIO_ACCOUNT_SID = ENV.str("TWILIO_ACCOUNT_SID")
TWILIO_AUTH_TOKEN = ENV.str("TWILIO_AUTH_TOKEN")
TWILIO_FROM_NUMBER = ENV.str("TWILIO_FROM_NUMBER")
