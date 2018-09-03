# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :socks,
  ecto_repos: [Socks.Repo]

# Configures the endpoint
config :socks, Socks.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k2vK3Uz3apyA2so0bwC3A816WVWBFKfMNuxS+C/oZZDyQ2MQaQa5/71LdvDAFvu8",
  render_errors: [view: Socks.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Socks.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
