# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tapuma,
  ecto_repos: [Tapuma.Repo]

# Configures the endpoint
config :tapuma, TapumaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S4LYwIkbZD6A2ryQxjFzhqaz7vy2PUWQ1rdmupnv8IF10yOYyWHAJHl3rs909hTq",
  render_errors: [view: TapumaWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Tapuma.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
