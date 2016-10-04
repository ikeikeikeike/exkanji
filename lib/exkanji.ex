defmodule Exkanji do
  @doc """
  Exkanji.parse returns parsed result by mecab working.
  """
  defdelegate parse(text), to: Exkanji.Mecab, as: :parse
  @doc """
  Exkanji.Mecab.parse/2 has two options `:dict` and `:ext`.
  `:dict` option makes to change that sets Mecab's dictionaly into second arguments in Exkanji.parse function.
  `:ext` option makes to change Mecab's working, it returns result with romaji and hiragana attributes.
  """
  defdelegate parse(text, option), to: Exkanji.Mecab, as: :parse

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

  @doc """
  Exkanji.sound returns japanese sound letter with kanji that like vowels and consonants after translate working.
  """
  defdelegate sound(text), to: Exkanji.Translator, as: :sound

end
