defmodule Exkanji.Translator do
  require Exromaji
  alias Exkanji.Mecab

  @moduledoc false

  @doc false
  def katakana(text) do
    text
    |> convert
    |> Exromaji.katakana
  end

  @doc false
  def hiragana(text) do
    text
    |> convert
    |> Exromaji.hiragana
  end

  @doc false
  def romaji(text) do
    text
    |> convert
    |> Exromaji.romaji
  end

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
