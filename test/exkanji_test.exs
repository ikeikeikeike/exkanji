defmodule ExkanjiTest do
  use ExUnit.Case
  doctest Exkanji

  test "Hiragana: Simply" do
    assert Exkanji.hiragana("hiragana") == "ひらがな"
  end

  test "Hiragana: Vowel letters" do
    assert Exkanji.hiragana("a i u e o") == "あ い う え お"
  end

  test "Hiragana: Consonant letters" do
    assert Exkanji.hiragana("s k x p") == "s k x p"
  end

  test "Hiragana: Kind of A letters" do
    assert Exkanji.hiragana("ａ a A ア ｱ ァ ｧ あ ぁ 亜") == "あ あ あ あ あ ぁ ぁ あ ぁ あ"
  end

  test "Hiragana: Normally" do
    assert Exkanji.hiragana("平仮名 ひらがな hiragana") == "ひらがな ひらがな ひらがな"
  end

  test "Katakana: Kind of A letters" do
    assert Exkanji.katakana("ａ a A ア ｱ ァ ｧ あ ぁ 亜") == "ア ア ア ア ア ァ ァ ア ァ ア"
  end

  test "Katakana: Normally" do
    assert Exkanji.katakana("片仮名 かたかな katakana") == "カタカナ カタカナ カタカナ"
  end


end
