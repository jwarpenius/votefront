use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# ChoicelyVotefront.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :choicely_votefront, ChoicelyVotefront.Endpoint,
  load_from_system_env: true,
  url: [host: "votefronttest.choicely.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true,
  root: ".",
  version: Application.spec(:choicely_votefront, :vsn)

# Do not print debug messages in production
config :logger, level: :info

# config :goth, json: {:system, "GCP_CREDENTIALS"}

config :goth,
  json: "./config/gcloud-config-test.secret.json" |> File.read!