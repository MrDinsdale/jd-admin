use Mix.Config

config :logger, level: :warn

config :jd_admin, JdAdmin.Endpoint,
  http: [port: 4001],
  server: false

config :basic_auth, [
  realm: "Admin Area",
  username: "admin",
  password: ""
]

config :jd_admin, JdAdmin.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jd_admin_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
