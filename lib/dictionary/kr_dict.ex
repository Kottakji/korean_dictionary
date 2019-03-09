defmodule KoreanDictionary.KRDict do
  @moduledoc false
  alias KoreanDictionary.KRDictAPI

  @doc """
  Translate to a list of {word, definition} tuples
  """
  def korean_to_english(korean) do
    KRDictAPI.get_words(korean, "english")
    |> get_all_words_from_xml
  end

  def korean_to_korean(korean) do
    KRDictAPI.get_words(korean, "korean")
    |> get_all_korean_words_from_xml(korean)
  end

  @doc """
  Translate to a list of example sentences
  """
  def korean_example_sentences(korean) do
    KRDictAPI.get_sentences(korean, "english")
    |> get_all_sentences_from_xml
  end

  @doc """
  Get all the words and definitions from the response xml
  """
  def get_all_words_from_xml(xml) do
    words =
      xml
      |> Exml.parse()
      |> Exml.get("//trans_word")

    definitions =
      xml
      |> Exml.parse()
      |> Exml.get("//trans_dfn")

    zip(words, definitions)
  end

  @doc """
  Get all the korean words from the response xml
  """
  def get_all_korean_words_from_xml(xml, korean) do
    xml
    |> Exml.parse()
    |> Exml.get("/channel/item[word='" <> korean <> "']/sense/definition")
  end

  @doc """
  Get all the sentences from the response xml
  """
  def get_all_sentences_from_xml(xml) do
    case xml
         |> Exml.parse()
         |> Exml.get("//example") do
      nil -> []
      map -> Enum.map(map, fn x -> String.trim(x) end)
    end
  end

  @doc """
  When there are no words nor definitions
  """
  def zip(word, definition) when is_nil(word) and is_nil(definition) do
    []
  end

  @doc """
  When only a single word and definition have been extracted
  """
  def zip(word, definition) when is_bitstring(word) and is_bitstring(definition) do
    [{word, definition}]
  end

  @doc """
  Just zip it when a list of words and definitions have been extracted
  """
  def zip(words, definitions) do
    Enum.zip(words, definitions)
  end
end
