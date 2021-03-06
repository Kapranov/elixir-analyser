defmodule ElixirAnalyser.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_analyser,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ex_unit]
    ]
  end

  defp deps do
    [
      {:ex_unit_notifier, "~> 0.1", only: [:test]},
      {:jason, "~> 1.2"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp escript do
    [main_module: ElixirAnalyzer.CLI]
  end
end
