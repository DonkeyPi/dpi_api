defmodule Dpi.Api.MixProject do
  use Mix.Project

  def project do
    [
      app: :dpi_api,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :public_key, :ssh, :crypto]
    ]
  end

  defp deps do
    []
  end
end
