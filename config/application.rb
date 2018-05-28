require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OAuth2Sample
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.load_defaults 5.2

    config.generators do |generate|
      generate.factory_bot false
      generate.helper = false
      generate.helper_specs false
      generate.javascripts false
      generate.stylesheets false
      generate.template_engine :erb
      generate.test_framework :rspec, fixture: false
      generate.view_specs false
    end

    config.encoding = 'utf-8'
    config.time_zone = 'Prague'
    config.generators.system_tests = nil
  end
end
