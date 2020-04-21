require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # RedisStoreを本番環境（AWS）で利用するための設定
    config.active_record.cache_versioning = false

    # Redis の初期設定
    # NOTE: 詳細は session_store.rb を参照
    if Rails.env.development?
      config.cache_store = :redis_store, ENV['REDIS_FULL_URL'], { expires_in: 90.minutes }
    else
      config.cache_store = :redis_store, ENV['REDIS_FULL_URL'], { expires_in: 90.minutes }
    end
  end
end
