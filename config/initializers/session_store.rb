# Be sure to restart your server when you modify this file.

# Rails.application.config.session_store :cookie_store, key: '_store_app_session' (revised because rake new sessions created not work)
Rails.application.config.session_store :active_record_store, key: '_store_app_session'