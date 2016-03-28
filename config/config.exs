# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :home_work_manager, HomeWorkManager.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "BANE8vX84FG3Hxd4pWsjPbNEIWKHMPZ/6eDnnskYS1oAuyydDfm5YL/22FKTQHqy",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: HomeWorkManager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :guardian, Guardian,
  issuer: "HomeWorkManager",
  ttl: { 3, :days },
  verify_issuer: true,
  secret_key: "BANE8vX84FG3Hxd4pWsjPbNEIWKHMPZ/6eDnnskYS1oAuyydDfm5YL/22FKTQHqy",
  serializer: PhoenixTrello.GuardianSerializer
