defmodule Exkanji.Mecab do
  require Exromaji

  defstruct [:surface, :feature, :pos, :pos1, :pos2, :pos3, :cform, :ctype, :base, :read, :pron, :romaji, :hiragana]

  @moduledoc false

  # TODO: can change dictionaly in option arg
  @doc false
  def parse(text, option \\ [])
  def parse(text, option) when is_binary(text), do: parse(to_char_list(text), option)
  def parse(text, option) when is_atom(text), do: parse(to_char_list(text), option)
  def parse(text, option) when is_list(text) do
    dict = if option[:dict], do: [' -d', prepare(option[:dict])], else: []

    structs =
      :os.cmd(:string.join(['echo ', prepare(text), ' | mecab'] ++ dict, ''))
      |> to_string
      |> String.split("\n")
      |> Enum.filter_map(&(&1 != "EOS" && &1 != ""), &parse_line(&1, option))

    case structs do
      {:error, reason} ->
        {:error, reason}
      _ ->
        {:ok, structs}
    end
  end
  def parse(_, _), do: {:error, "type error: need to set atom or string or binary in this argument"}

  defp parse_line(line, option) when is_binary(line) do
    [s, f] = String.split(line, "\t")

    case String.split(f, ",") do
      [p, p1, p2, p3, cf, ct, b, r, pr] ->
        st = %Exkanji.Mecab{surface: s, feature: f, pos: p, pos1: p1, pos2: p2, pos3: p3, cform: cf, ctype: ct, base: b, read: r, pron: pr}

        w = if r, do: r, else: s
        if option[:ext], do: %{st | romaji: Exromaji.romaji(w), hiragana: Exromaji.hiragana(w)}, else: st
      [p, p1, p2, p3, cf, ct, b] ->
        st = %Exkanji.Mecab{surface: s, feature: f, pos: p, pos1: p1, pos2: p2, pos3: p3, cform: cf, ctype: ct, base: b}

        if option[:ext], do: %{st | romaji: Exromaji.romaji(s), hiragana: Exromaji.hiragana(s)}, else: st
      _ ->
        {:error, "cannot parse line"}
    end
  end
  defp parse_line(_, _), do: {:error, "cannot set mecab's line to %Exkanji.Mecab{}"}

  defp prepare(text) do
    text
    |> to_string
    |> String.codepoints
    |> Enum.map(fn(p) ->
      if Enum.member?(["'", "\"", "&", ";", "|", "<", ">", "(", ")", "`"], p), do: ~s(\\#{p}), else: p
    end)
    |> Enum.join
    |> to_char_list
  end

end
