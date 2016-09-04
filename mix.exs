defmodule Bloodhound.Mixfile do
  use Mix.Project

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Ian Walter"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/AdocA/bloodhound"}
    ]
  end

  defp description do
    """
    An ElasticSearch library for Elixir that can be easily integrated with Ecto
    """
  end

  def project do
    [
      app: :bloodhound,
      version: "0.2.1",
      elixir: "~> 1.3",
      elixirc_paths: elixirc_paths(Mix.env),
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: description,
      package: package
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.9.1"},
      {:poison, "~> 2.2"},
      {:earmark, "~> 1.0.1", only: :dev},
      {:ex_doc, "~> 0.13", only: :dev},
      {:ecto, "~> 2.0.4", only: :test}
    ]
  end
end
