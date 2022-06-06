require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PhonifyApi
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.action_dispatch.cookies_same_site_protection = :strict
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use config.session_store, config.session_options

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:4000','http://localhost:4000/Cart'
        resource '*', 
          headers: :any, 
          expose: ['access-token', 'expiry', 'token-type', 'uid', 'client'],
          methods: [:get, :post, :options, :delete, :put], credentials: true
      end
    end
  end
end
