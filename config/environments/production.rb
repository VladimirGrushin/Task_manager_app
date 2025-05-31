require "active_support/core_ext/integer/time"

TaskManagerApp::Application.configure do
  # Основные настройки
  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Ассеты
  config.assets.compile = false
  config.assets.digest = true
  config.assets.js_compressor = :terser
  config.assets.css_compressor = :sass

  # Кэширование
  config.action_controller.perform_caching = true
  config.cache_store = :memory_store
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.year.to_i}"
  }

  # Безопасность
  config.force_ssl = true
  config.ssl_options = { redirect: { exclude: -> request { request.path =~ /healthcheck/ } } }

  # Логирование
  config.log_level = :info
  config.log_tags = [:request_id]
  config.log_formatter = ::Logger::Formatter.new

  # Active Job
  config.active_job.queue_adapter = :async

  # Active Storage
  config.active_storage.service = :local

  # База данных
  config.active_record.dump_schema_after_migration = false

  # I18n
  config.i18n.fallbacks = true

  # Mailer
  config.action_mailer.default_url_options = { host: ENV['APP_HOST'] || 'your-render-app.onrender.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: 587,
    domain: 'your-render-app.onrender.com',
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    authentication: :plain,
    enable_starttls_auto: true
  }

  # Отключение ненужных компонентов
  config.solid_cable.enabled = false if defined?(SolidCable)
end
