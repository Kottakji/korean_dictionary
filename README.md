# KoreanDictionary



[![Build Status](https://travis-ci.org/JorisKok/korean_dictionary.svg?branch=master)](https://travis-ci.org/JorisKok/korean_dictionary)
[![Hex pm](http://img.shields.io/hexpm/v/korean_dictionary.svg?style=flat)](https://hex.pm/packages/korean_dictionary)

Docs: [https://hexdocs.pm/korean_dictionary](https://hexdocs.pm/korean_dictionary).


## How to use

Get your key from
https://krdict.korean.go.kr/openApi/openApiInfo  (it's free!)

Add the key to config.exs
```elixir
config :korean_dictionary, key: "YOUR_KEY"
```

Add to mix.exs

```elixir
def deps do
  [
    {:korean_dictionary, "~> 0.3.0"}
  ]
end
```

##### For English word definitions
```elixir
KoreanDictionary.korean_to_english("한국")  
```
which will return:
```elixir
[
  %{
    translations: [
      {"Korea",
       "A country located in East Asia; it consists of the Korean Peninsula and affiliated islands; divided into South Korea and North Korea since the 1953 ceasefire agreement, it is called either the Republic of Korea or South Korea; the official language is Korean and the capital is Seoul."}
    ],
    word: "한국"
  },
  %{
    translations: [
      {"Korean; Korean language", "The language used by the Korean people."}
    ],
    word: "한국말"
  },
  %{
    translations: [
      {"Korean; Korean language", "The language used by the Korean people."}
    ],
    word: "한국어"
  },
  %{
    translations: [
      {"Korean; Korean people",
       "A person who has the nationality of Republic of Korea or a descendent of a Korean lineage and spirit."}
    ],
    word: "한국인"
  },
  %{
    translations: [
      {"being Korean; Korean style",
       "A state of having a unique quality of Korea or being right for Korea. "}
    ],
    word: "한국적"
  },
  %{
    translations: [
      {"Korean ",
       "Having a unique quality of Korea or being congruous to Korea."}
    ],
    word: "한국적"
  },
  %{
    translations: [
      {"Korean beauty; Korean aesthetics ",
       "The beauty of Korea, or Korean aesthetic appeal.  "}
    ],
    word: "한국미"
  },
  %{
    translations: [{"Korean history", "The history of Korea. "}],
    word: "한국사"
  },
  %{
    translations: [
      {"Korean studies",
       "A field of study that studies Korean history, geology, culture, politics, economy, etc. "}
    ],
    word: "한국학"
  }
]
```

##### For Korean to Korean (with an 'easy' explanation describing the word)
```elixir
KoreanDictionary.korean_to_korean("남")
```

which will return a list of explanations
```elixir
[
  "내가 아닌 다른 사람.",
  "나와 관계가 없거나 관계가 끊어진 사람.",
  "남성으로 태어난 사람.",
  "동서남북의 네 방위 중의 하나로 나침반의 에스 극이 가리키는 쪽."
]
```


##### For Korean example sentences
```elixir
KoreanDictionary.korean_example_sentences("공부하다")
```

which will return a list of example sentences
```elixir
[
"건축학을 공부하다.", "게을리 공부하다.",
 "경영학을 공부하다.", "경쟁적으로 공부하다.",
 "경전을 공부하다.", "고대사를 공부하다.",
 "고전 음악을 공부하다.", "고학으로 공부하다.",
 "착실히 공부하다.", "장학금으로 공부하다."
]
```
