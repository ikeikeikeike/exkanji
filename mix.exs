defmodule Exkanji.Mixfile do
  use Mix.Project

  @description """
  A Elixir library for translating between hiragana, katakana, romaji and kanji. It uses Mecab.
  """

  def project do
    [app: :exkanji,
     version: "0.2.6",
     elixir: ">= 1.0.0",
     source_url: "https://github.com/ikeikeikeike/exromaji",
     docs: [extras: ["README.md"]],
     description: @description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: []]
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
      {:exromaji, "~> 0.2"},
      {:earmark, "~> 0.2", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev},
      {:inch_ex, only: :docs},
    ]
  end

  defp package do
    [ maintainers: ["Tatsuo Ikeda / ikeikeikeike"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ikeikeikeike/exkanji"},
    ]
  end

end
