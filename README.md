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
    {:korean_dictionary, "~> 0.1.0"}
  ]
end
```

##### For English word definitions
```elixir
KoreanDictionary.korean_to_english("한국어")
```
which will return a list with tuples {word, definition}
```elixir
[{"Korean; Korean language", "The language used by the Korean people."}]
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
  "이 오페라는 한국어로 공연한대.",
  "한국어에는 특별한 나이를 가리키는 말이 여럿 있다.",
  "한국어는 강세가 없어서 나는 강세를 가진 언어를 배우는 게 어려웠다."
]
```
