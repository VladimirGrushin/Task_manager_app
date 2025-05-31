# config/puma.rb

# Количество процессов (workers)
workers ENV.fetch("WEB_CONCURRENCY", 2)

# Количество потоков на процесс
threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)
threads threads_count, threads_count

# Базовые настройки
port ENV.fetch("PORT", 3000)
environment ENV.fetch("RAILS_ENV", "production")

# Оптимизация для production
preload_app!
plugin :tmp_restart

# Настройки для production окружения
if ENV["RAILS_ENV"] == "production"
  # Persist the worker state between restarts
  state_path "tmp/puma.state"
  activate_control_app

  # Logging
  stdout_redirect "log/puma.stdout.log", "log/puma.stderr.log", true

  # Daemonize (отключено для Render)
  # daemonize true
end

# Отключите Solid Queue в Puma (мы используем :async адаптер)
# plugin :solid_queue if ENV["SOLID_QUEUE_IN_PUMA"]

# Настройки для работы с Active Record
before_fork do
  ActiveRecord::Base.connection_pool.disconnect! if defined?(ActiveRecord)
end

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

# Уменьшите таймауты для Render
worker_timeout 30
worker_shutdown_timeout 15
