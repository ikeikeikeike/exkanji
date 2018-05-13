defmodule ExkanjiTest do
  use ExUnit.Case
  doctest Exkanji

  test "hiragana: Simply" do
    assert Exkanji.hiragana("hiragana") == "ひらがな"
  end

  test "hiragana: Vowel letters" do
    assert Exkanji.hiragana("a i u e o") == "あ い う え お"
  end

  test "hiragana: Consonant letters" do
    assert Exkanji.hiragana("s k x p") == "s k x p"
  end

  test "hiragana: Kind of A letters" do
    assert Exkanji.hiragana("ａ a A ア ｱ ァ ｧ あ ぁ 亜") == "あ あ あ あ あ ぁ ぁ あ ぁ あ"
  end

  test "hiragana: Normally" do
    assert Exkanji.hiragana("平仮名 ひらがな hiragana") == "ひらがな ひらがな ひらがな"
  end

  test "katakana: Kind of A letters" do
    assert Exkanji.katakana("ａ a A ア ｱ ァ ｧ あ ぁ 亜") == "ア ア ア ア ア ァ ァ ア ァ ア"
  end

  test "katakana: Normally" do
    assert Exkanji.katakana("片仮名 かたかな katakana") == "カタカナ カタカナ カタカナ"
  end

  test "romaji: Kind of A letters" do
    assert Exkanji.romaji("ａ a A ア ｱ ァ ｧ あ ぁ 亜") == "a a a a a ァ ァ a ァ a"
  end

  test "romaji: Normally" do
    assert Exkanji.romaji("片仮名 かたかな katakana") == "katakana katakana katakana"
  end

  test "it keeps white spaces and U+3000(IDEOGRAPHIC SPACE)" do
    assert Exkanji.romaji("片仮名　 かたかな　　　 katakana") == "katakana　 katakana　　　 katakana"
  end

  # test "it can change dictionary as required" do
  # {:ok, nor} = Exkanji.parse "エモいオナ中がTBSマジ意味不"
  # {:ok, new} = Exkanji.parse "エモいオナ中がTBSマジ意味不", dict: "/opt/local/lib/mecab/dic/neologd-utf8"
  # assert length(nor) != length(new)
  # end

  test "Sound 1" do
    assert Exkanji.sound("ギャオス") == "か"
  end

  test "Sound 2" do
    assert Exkanji.sound("IYカード") == "あ"
  end

  test "Sound 3" do
    assert Exkanji.sound("Japan") == "さ"
  end

  test "Sound 4" do
    assert Exkanji.sound("ねんとう") == "な"
  end

  test "Sound 5" do
    assert Exkanji.sound("愛のり") == "あ"
  end

  test "Sound 6" do
    assert Exkanji.sound("日本") == "な"
  end
end
