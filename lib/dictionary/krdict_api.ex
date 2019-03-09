defmodule KoreanDictionary.KRDictAPI do
  @moduledoc false

  @doc """
  Get the English word definitions
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "english") do
    get_body(korean, "y", "1", "word")
  end

  @doc """
  Get the Korean word definitions
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "korean") do
    get_body(korean, "n", "1", "word")
  end

  @doc """
  Get the English sentence definitions
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_sentences(korean, "english") do
    get_body(korean, "y", "1", "exam")
  end

  @doc """
  Get the body
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_body(korean, translated, language, type) do
    HTTPoison.start()
    key = Application.get_env(:korean_dictionary, :key)

    if key == nil do
      raise ":korean_dictionary :key env variable not set. Get one at https://krdict.korean.go.kr/openApi/openApiInfo and add it to your config.exs"
    end

    %HTTPoison.Response{body: body} =
      HTTPoison.get!(
        "https://krdict.korean.go.kr/api/search?key=" <>
          key <>
          "&q=" <>
          korean <>
          "&trans_lang=" <>
          language <>
          "&translated=" <>
          translated <>
          "&part=" <> type
      )

    body
  end
end
