Rails.application.configure do


  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.read_encrypted_secrets = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.log_level = :debug
  config.log_tags = [ :request_id ]
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new

  config.cache_classes = true
  config.serve_static_assets = true
  config.assets.compile = true
  config.assets.digest = true

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.action_mailer.default_url_options = { :host => 'https://immense-ocean-13499.herokuapp.com'}
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false

ActionMailer::Base.smtp_settings = {
  :address          => "smtp.sendgrid.net",
  :port             => "25",
  :authentication   => :plain,
  :user_name        => ENV['SENDGRID_USERNAME'],
  :password         => ENV['SENDGRID_PASSWORD']
}
  config.active_record.dump_schema_after_migration = true

end
