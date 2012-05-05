CopycopterClient.configure do |config|
  config.api_key = APP_CONFIG.copycopter_key
  config.host = APP_CONFIG.copycopter_host
end