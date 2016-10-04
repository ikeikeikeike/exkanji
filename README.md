# Exkanji

[![Build Status](http://img.shields.io/travis/ikeikeikeike/exkanji.svg?style=flat-square)](http://travis-ci.org/ikeikeikeike/exkanji)
[![Hex version](https://img.shields.io/hexpm/v/exkanji.svg "Hex version")](https://hex.pm/packages/exkanji)
[![Hex downloads](https://img.shields.io/hexpm/dt/exkanji.svg "Hex downloads")](https://hex.pm/packages/exkanji)
[![Inline docs](https://inch-ci.org/github/ikeikeikeike/exkanji.svg)](http://inch-ci.org/github/ikeikeikeike/exkanji)
[![hex.pm](https://img.shields.io/hexpm/l/ltsv.svg)](https://github.com/ikeikeikeike/exkanji/blob/master/LICENSE)


A Elixir library for translating between hiragana, katakana, romaji and kanji. It uses Mecab.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add exkanji to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:exkanji, "~> x.x"}]
  end
  ```

  2. Exkanji package needs `nkf` and `mecab` command and it needs to install those in your environment when you don't have those.

  ```zsh
  $ brew install nkf
  $ brew install mecab mecab-ipadic
  ```

# Usage

Exkanji provides some convinient functions in Exkanji module through Exkanji.Translator and Exkanji.Mecab.
Those provided functions are able to translate into hiragana(ひらがな), katakana(カタカナ) and Romaji(ローマ字).

Into hiragana(ひらがな)
```Elixir
iex(1)> Exkanji.hiragana "ａ a A ア ｱ ァ ｧ あ ぁ 亜"
"あ あ あ あ あ ぁ ぁ あ ぁ あ"
iex(2)> Exkanji.hiragana "平仮名 ひらがな hiragana"
"ひらがな ひらがな ひらがな"
```

Into katakana(カタカナ)
```Elixir
iex(3)> Exkanji.katakana "ａ a A ア ｱ ァ ｧ あ ぁ 亜"
"ア ア ア ア ア ァ ァ ア ァ ア"
iex(4)> Exkanji.katakana "片仮名 かたかな katakana"
"カタカナ カタカナ カタカナ"
```

Into Romaji(ローマ字)
```Elixir
iex(5)> Exkanji.romaji "ａ a A ア ｱ ァ ｧ あ ぁ 亜"
"a a a a a ァ ァ a ァ a"
iex(6)> Exkanji.romaji "ローマ字 ろーまじ ローマジ"
"ro-maji ro-maji ro-maji"
```

## As a Morphological Analyzer.

Exkanji is capable of detecting Part-of-Speech from text, As a Morphological Analyzer. It uses Mecab.

```Elixir
iex(1)> Exkanji.parse "エモい"
{:ok,
 [%Exkanji.Mecab{base: "*", cform: "*", ctype: "*",
   feature: "名詞,一般,*,*,*,*,*", hiragana: nil, pos: "名詞",
   pos1: "一般", pos2: "*", pos3: "*", pron: nil, read: nil, romaji: nil,
   surface: "エモ"},
  %Exkanji.Mecab{base: "いる", cform: "一段", ctype: "連用形",
   feature: "動詞,自立,*,*,一段,連用形,いる,イ,イ", hiragana: nil,
   pos: "動詞", pos1: "自立", pos2: "*", pos3: "*", pron: "イ",
   read: "イ", romaji: nil, surface: "い"}]}
```

It also makes to change that sets Mecab's dictionaly into second arguments in Exkanji.parse function.

```Elixir
iex(2)> Exkanji.parse "エモい", dict: "/opt/local/lib/mecab/dic/neologd-utf8"
{:ok,
 [%Exkanji.Mecab{base: "エモい", cform: "*", ctype: "*",
   feature: "名詞,固有名詞,一般,*,*,*,エモい,エモイ,エモイ",
   hiragana: nil, pos: "名詞", pos1: "固有名詞", pos2: "一般",
   pos3: "*", pron: "エモイ", read: "エモイ", romaji: nil,
   surface: "エモい"}]}
```

[API Reference](http://hexdocs.pm/exkanji/).
