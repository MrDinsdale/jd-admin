use Mix.Config

config :phoenix, :stacktrace_depth, 20
config :logger, :console, format: "[$level] $message\n"

config :jd_admin, :basic_auth, [
  realm: "Admin Area",
  username: "admin",
  password: ""
]

config :jd_admin, JdAdmin.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin"]]

config :jd_admin, JdAdmin.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

config :jd_admin, JdAdmin.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "jd_admin_dev",
  hostname: "localhost",
  pool_size: 10
