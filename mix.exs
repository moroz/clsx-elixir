defmodule Clsx.MixProject do
  use Mix.Project

  def project do
    [
      app: :clsx,
      version: "0.2.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Simple helper functions to conditionally determine class names.
    This library is largely inspired by the JavaScript library
    [clsx](https://www.npmjs.com/package/clsx), commonly used in the
    React ecosystem.
    """
  end

  defp package do
    [
      licenses: ["BSD-3"],
      links: %{
        "Github" => "https://github.com/moroz/clsx-elixir"
      }
    ]
  end
end
