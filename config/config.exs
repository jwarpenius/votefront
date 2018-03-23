# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :choicely_votefront, ChoicelyVotefront.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fjMja9HZ+kzBHE3Qa4RbiogTvOBd0RceQgvfxYr6R2ERmgaS1ip66HtdVuQP7erw",
  render_errors: [view: ChoicelyVotefront.ErrorView, accepts: ~w(json)]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  json: Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
