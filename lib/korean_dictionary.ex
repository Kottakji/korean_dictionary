defmodule KoreanDictionary do
  alias KoreanDictionary.KRDict

  @moduledoc """
  A Korean dictionary\n
  Supports multiple languages\n
  Implements the KRDict\n
  http://krdict.korean.go.kr/
  """

  @doc """
  Translate Korean to English\n
  Returns the word definitions in a tuple {english word, definition}
  """
  defdelegate korean_to_english(korean), to: KRDict

  @doc """
  Translate Korean to Korean (an easy definition)\n
  Returns the word definitions in a list
  """
  defdelegate korean_to_korean(korean), to: KRDict

  @doc """
  Translate Korean to Japanese\n
  Returns the word definitions in a tuple {Japanese word, definition}
  """
  defdelegate korean_to_japanese(korean), to: KRDict

  @doc """
  Translate Korean to French\n
  Returns the word definitions in a tuple {French word, definition}
  """
  defdelegate korean_to_french(korean), to: KRDict

  @doc """
  Translate Korean to Spanish\n
  Returns the word definitions in a tuple {Spanish word, definition}
  """
  defdelegate korean_to_spanish(korean), to: KRDict

  @doc """
  Translate Korean to Arabian\n
  Returns the word definitions in a tuple {Arabian word, definition}
  """
  defdelegate korean_to_arabian(korean), to: KRDict
  
  @doc """
  Translate Korean to Mongolian\n
  Returns the word definitions in a tuple {Mongolian word, definition}
  """
  defdelegate korean_to_mongolian(korean), to: KRDict
  
  @doc """
  Translate Korean to Vietnamese\n
  Returns the word definitions in a tuple {Vietnamese word, definition}
  """
  defdelegate korean_to_vietnamese(korean), to: KRDict
  
  @doc """
  Translate Korean to Thai\n
  Returns the word definitions in a tuple {Thai word, definition}
  """
  defdelegate korean_to_thai(korean), to: KRDict
  
  @doc """
  Translate Korean to Indonesian\n
  Returns the word definitions in a tuple {Indonesian word, definition}
  """
  defdelegate korean_to_indonesian(korean), to: KRDict
  
  @doc """
  Translate Korean to Russian\n
  Returns the word definitions in a tuple {Russian word, definition}
  """
  defdelegate korean_to_russia(korean), to: KRDict
  
  @doc """
  Returns example sentences in a list\n
  No translations per sentence are available
  """
  defdelegate korean_example_sentences(korean), to: KRDict
end
