require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module TaskManagerApp
  class Application < Rails::Application
    config.load_defaults 8.0

    config.autoload_lib(ignore: %w[assets tasks])

    if defined?(IRB)
      console do
        app_name = "task_manager-app"
        env = Rails.env[0..2]
        IRB.conf[:PROMPT] ||= {}
        IRB.conf[:PROMPT][:CUSTOM] = {
          PROMPT_I: "#{app_name}(#{env})> ",
          PROMPT_N: "#{app_name}(#{env})> ",
          PROMPT_S: "#{app_name}(#{env})%l> ",
          PROMPT_C: "#{app_name}(#{env})> "
        }
        IRB.conf[:PROMPT_MODE] = :CUSTOM
      end
    end
  end
end
