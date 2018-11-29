Mailjet.configure do |config|
  config.api_key = ENV['MAILJET_KEY']
  config.secret_key = ENV['MAILJET_SECRET']
  config.default_from = 'saghourkhalil@gmail.com'
end
