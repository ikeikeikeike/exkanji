# Exkanji

[![Build Status](http://img.shields.io/travis/ikeikeikeike/exkanji.svg?style=flat-square)](http://travis-ci.org/ikeikeikeike/exkanji)
[![Hex version](https://img.shields.io/hexpm/v/exkanji.svg "Hex version")](https://hex.pm/packages/exkanji)
[![Hex downloads](https://img.shields.io/hexpm/dt/exkanji.svg "Hex downloads")](https://hex.pm/packages/exkanji)
[![Inline docs](https://inch-ci.org/github/ikeikeikeike/exkanji.svg)](http://inch-ci.org/github/ikeikeikeike/exkanji)
[![hex.pm](https://img.shields.io/hexpm/l/ltsv.svg)](https://github.com/ikeikeikeike/exkanji/blob/master/LICENSE)


A Elixir library for converting between hiragana, katakana, romaji and kanji.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add exkanji to your list of dependencies in `mix.exs`:

  ```elixir
  def deps do
    [{:exkanji, "~> 0.2"}]
  end
  ```

  2. Exkanji package needs `nkf` and `mecab` command and it needs to install those in your environment when you don't have those.

  ```zsh
  $ brew install nkf
  $ brew install mecab mecab-ipadic
  ```

## Usage

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

#### As a Morphological Analyzer.

will write explain

```Elixir
iex(1)> Exkanji.parse "竹藪焼けた"
{:ok,
 [%Exkanji.Mecab{base: "竹", cform: "*", ctype: "*",
   feature: "名詞,一般,*,*,*,*,竹,タケ,タケ", hiragana: nil,
   pos: "名詞", pos1: "一般", pos2: "*", pos3: "*", pron: "タケ",
   read: "タケ", romaji: nil, surface: "竹"},
  %Exkanji.Mecab{base: "藪", cform: "*", ctype: "*",
   feature: "名詞,固有名詞,地域,一般,*,*,藪,ヤブ,ヤブ",
   hiragana: nil, pos: "名詞", pos1: "固有名詞", pos2: "地域",
   pos3: "一般", pron: "ヤブ", read: "ヤブ", romaji: nil, surface: "藪"},
  %Exkanji.Mecab{base: "焼ける", cform: "一段", ctype: "連用形",
   feature: "動詞,自立,*,*,一段,連用形,焼ける,ヤケ,ヤケ",
   hiragana: nil, pos: "動詞", pos1: "自立", pos2: "*", pos3: "*",
   pron: "ヤケ", read: "ヤケ", romaji: nil, surface: "焼け"},
  %Exkanji.Mecab{base: "た", cform: "特殊・タ", ctype: "基本形",
   feature: "助動詞,*,*,*,特殊・タ,基本形,た,タ,タ", hiragana: nil,
   pos: "助動詞", pos1: "*", pos2: "*", pos3: "*", pron: "タ", read: "タ",
   romaji: nil, surface: "た"}]}
```

[API Reference](http://hexdocs.pm/exkanji/).
