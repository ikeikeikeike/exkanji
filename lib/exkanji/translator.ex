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

  # TODO: replace white space to U+3000(IDEOGRAPHIC SPACE)
  defp convert(text) do
    text
    |> String.split
    |> Enum.map(fn(t) ->
      case Mecab.parse(t) do
        # {:error, _reason} -> nil
        {:ok, lines} ->
          lines
          |> Enum.map(fn(l) ->
            if l.read, do: l.read, else: l.surface
          end)
          |> Enum.join
      end
    end)
    |> Enum.join(" ")
  end

end
