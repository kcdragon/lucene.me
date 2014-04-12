require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

require 'java'

Dir["#{File.dirname(__FILE__)}/../vendor/jars/*.jar"].each do |jar|
  require jar
end

java_import 'org.apache.lucene.analysis.core.WhitespaceAnalyzer'
java_import 'org.apache.lucene.analysis.tokenattributes.CharTermAttribute'
java_import 'org.apache.lucene.analysis.tokenattributes.OffsetAttribute'
java_import 'org.apache.lucene.util.Version'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LuceneMe
  class Application < Rails::Application

    config.autoload_paths << "#{config.root}/app/decorators"
    config.autoload_paths << "#{config.root}/lib"

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
