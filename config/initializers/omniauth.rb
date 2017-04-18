CONSUMER_KEY = ENV['CONSUMER_KEY']
CONSUMER_SECRET = ENV['CONSUMER_SECRET']

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :quickbooks, CONSUMER_KEY, CONSUMER_SECRET
end