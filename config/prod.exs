use Mix.Config

config :logger, level: :info

config :jd_admin, JdAdmin.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [scheme: "https", host: "joedinsdale-admin.herokuapp.com", port: 443],
  force_ssl: [rewrite_on: [:x_forwarded_proto]],
  cache_static_manifest: "priv/static/manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :jd_admin, JdAdmin.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: {:system, "DATABASE_URL"},
  pool_size: 10,
  ssl: true

config :jd_admin, :basic_auth, [
  realm: "Admin Area",
  username: System.get_env("BASIC_AUTH_USER"),
  password: System.get_env("BASIC_AUTH_PASSWORD")
]
