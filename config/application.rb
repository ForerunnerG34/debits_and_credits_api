require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DebitsAndCreditsApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join('lib')
    config.api_only = true
  end
end
