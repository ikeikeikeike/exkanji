defmodule Exkanji.Translator do
  require Exromaji
  alias Exkanji.Mecab

  @moduledoc false

  @doc false
  def katakana(text) do
    text
    |> Exromaji.katakana
    |> convert
    |> Exromaji.katakana
  end

  @doc false
  def hiragana(text) do
    text
    |> Exromaji.hiragana
    |> convert
    |> Exromaji.hiragana
  end

  @doc false
  def romaji(text) do
    text
    |> Exromaji.romaji
    |> convert
    |> Exromaji.romaji
  end

  defp convert(text) do
    case Mecab.parse(String.replace(text, " ", "{{__}}")) do
      # {:error, _reason} -> nil
      {:ok, lines} ->
        lines
        |> Enum.map(fn(l) ->
          if l.read, do: l.read, else: l.surface
        end)
        |> Enum.map(&String.replace(&1, "{{__}}", " "))
        |> Enum.join
    end
  end
end
