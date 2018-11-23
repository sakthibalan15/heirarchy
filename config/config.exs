# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :heirarchy,
  ecto_repos: [Heirarchy.Repo]

# Configures the endpoint
config :heirarchy, HeirarchyWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "eE8sLZmt3MRgIbwfaTZGYe+9QFl0p/7A4Xp/RQx2TIuBF4LkcGv+YsCMx3imx12R",
  render_errors: [view: HeirarchyWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Heirarchy.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
