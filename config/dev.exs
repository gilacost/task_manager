use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :home_work_manager, HomeWorkManager.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [
      node: ["node_modules/webpack/bin/webpack.js", "--watch", "--color"]
  ]


# Watch static and templates for browser reloading.
config :home_work_manager, HomeWorkManager.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development.
# Do not configure such in production as keeping
# and calculating stacktraces is usually expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :home_work_manager, HomeWorkManager.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "pepito",
  password: "pepito",
  database: "home_work_manager",
  hostname: "192.168.99.100",
  pool_size: 10
