use Mix.Config

config :jd_admin, JdAdmin.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "GsLLD+KCbhlyHGbq+Zss23iYXibcQWWhEgkKCNFgTTTsxW71ASVHPX5W/tPMKx0c",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: JdAdmin.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

import_config "#{Mix.env}.exs"

config :phoenix, :generators,
  migration: true,
  binary_id: false

config :arc,
  bucket: System.get_env("AWS_BUCKET")

config :ex_aws,
  access_key_id: System.get_env("AWS_ACCESS_KEY"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: "eu-west-1"

config :jd_admin, :basic_auth, [
  realm: "Admin Area",
  username: System.get_env("BASIC_AUTH_USER"),
  password: System.get_env("BASIC_AUTH_PASSWORD")
]
