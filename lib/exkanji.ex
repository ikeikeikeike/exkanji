defmodule Exkanji do
  @doc """
  Exkanji.parse returns parsed result by mecab working.
  """
  defdelegate parse(text), to: Exkanji.Mecab, as: :parse

  @doc """
  Exkanji.romaji returns romaji text after translate working.
  """
  defdelegate romaji(text), to: Exkanji.Translator, as: :romaji

  @doc """
  Exkanji.katakana returns katakana text after translate working.
  """
  defdelegate katakana(text), to: Exkanji.Translator, as: :katakana
  @doc """
  Alias Exkanji.katakana
  """
  defdelegate kata(text), to: Exkanji.Translator, as: :katakana

  @doc """
  Exkanji.hiragana returns hiragana text after translate working.
  """
  defdelegate hiragana(text), to: Exkanji.Translator, as: :hiragana
  @doc """
  Alias hiragana
  """
  defdelegate hira(text), to: Exkanji.Translator, as: :hiragana
end
