defmodule ChoicelyFrontend.Mixfile do
  use Mix.Project

  def project do
    [
      app: :choicely_votefront,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env),
      compilers: [:phoenix, :gettext] ++ Mix.compilers,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ChoicelyFrontend.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.3.2"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:distillery, "~> 1.5.2", runtime: false},
      {:ex_json_schema, "~> 0.5.6"},
      {:google_api_pub_sub, "~> 0.0.1"},
      {:goth, "~> 0.8.0"},
      {:gettext, "~> 0.15"},
      {:cowboy, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:hackney, "1.6.1", override: true} # don't upgrade, see https://gitlab.com/choicely/data-service/issues/4
    ]
  end
end
