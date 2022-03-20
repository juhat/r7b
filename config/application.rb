require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module R7b
  class Application < Rails::Application
    config.load_defaults 7.0
    # config.time_zone = "Central Time (US & Canada)"
    config.i18n.available_locales = [:en, :hu]
    config.i18n.default_locale = :hu
    config.active_job.queue_adapter = :sidekiq
  end
end
