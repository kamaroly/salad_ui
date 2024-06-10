defmodule SaladUI.MixProject do
  use Mix.Project

  def project do
    [
      app: :salad_ui,
      version: "0.4.2",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "SaladUI",
      description: description(),
      source_url: "https://github.com/bluzky/salad_ui",
      docs: docs(),
      package: package(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      maintainers: ["Dung Nguyen"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bluzky/salad_ui"},
      files: ~w(lib assets .formatter.exs mix.exs README*)
    ]
  end

  defp description do
    "Phoenix UI components library inspired by shadcn ui"
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tails, "~> 0.1.5"},
      {:phoenix, "~> 1.7"},
      {:heroicons, "~> 0.5.3"},
      {:phoenix_ecto, "~> 4.4"},
      {:phoenix_html, "~> 4.0"},
      {:mix_test_watch, "~> 1.2"},
      {:phoenix_live_view, "~> 0.20.1"},
      {:phoenix_html_helpers, "~> 1.0"},
      {:excoveralls, "~> 0.10", only: :test},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:styler, "~> 0.7", only: [:dev, :test], runtime: false},
      {:tailwind, "~> 0.2", only: [:dev, :test], runtime: Mix.env() == :dev}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      test: ["test  --color"],
      audit: ["format", "credo", "coveralls"]
    ]
  end
end
