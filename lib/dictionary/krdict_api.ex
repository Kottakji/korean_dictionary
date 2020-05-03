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
  Get the Spanish translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "spanish") do
    get_body(korean, "y", "4", "word")
  end

  @doc """
  Get the French translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "french") do
    get_body(korean, "y", "3", "word")
  end

  @doc """
  Get the Arabian translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "arabian") do
    get_body(korean, "y", "5", "word")
  end
  
  @doc """
  Get the Russian translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "russian") do
    get_body(korean, "y", "10", "word")
  end


  @doc """
  Get the Thai translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "thai") do
    get_body(korean, "y", "8", "word")
  end

  @doc """
  Get the Indonesian translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "indonesian") do
    get_body(korean, "y", "9", "word")
  end

  @doc """
  Get the Vietnamese translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "vietnamese") do
    get_body(korean, "y", "7", "word")
  end

  @doc """
  Get the Japanese translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "japanese") do
    get_body(korean, "y", "2", "word")
  end

  @doc """
  Get the Mongolian translations
  https://krdict.korean.go.kr/openApi/openApiInfo
  """
  def get_words(korean, "mongolian") do
    get_body(korean, "y", "6", "word")
  end
  
  @doc """
  Get the Korean sentence definitions
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
          "&part=" <> type,
        [],
        ssl: [ciphers: [{:rsa, :aes_128_gcm, :null, :sha256}]],
        timeout: 50_000,
        recv_timeout: 50_000
      )

    body
  end
end
