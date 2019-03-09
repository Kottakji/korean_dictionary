defmodule KoreanDictionary.MixProject do
  use Mix.Project

  def project do
    [
      app: :korean_dictionary,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),

      # Docs
      name: "Korean Dictionary",
      source_url: "https://github.com/JorisKok/korean_dictionary",
      docs: [
        main: "KoreanDictionary",
        extras: ["README.md"]
      ],
    ]
  end

  defp description do
    "A Korean dictionary based on KRDict\n
    Supports Korean to English words and sentences\n
    Requires an API key for KRDict (which is free)\n
    Get your key at https://krdict.korean.go.kr/openApi/openApiInfo"
  end

  defp package do
    [
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/JorisKok/korean_dictionary"
      }
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
      {:httpoison, "~> 1.4"},
      {:exml, "~> 0.1.1"},
      # Only :dev
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
      {:assert_value, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.19", only: :dev, runtime: false},
    ]
  end
end
