# Be sure to restart your server when you modify this file.

Webapp::Application.config.session_store :redis_store, {
  servers: [
    {
      host: ENV['REDIS_HOSTNAME'],
      port: ENV['REDIS_PORT'],
      namespace: ENV['REDIS_NAMESPACE']
    },
  ],
  expire_after: ENV['REDIS_EXPIRE'].to_time,
  key: '_#{Rails.application.class.parent_name.downcase}_session'
}
