Airbrake.configure do |config|
  config.api_key = APP_CONFIG.airbrake_key
  config.ignore_only = []
end
