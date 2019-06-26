defmodule KoreanDictionary.KoreanDictionaryTest do
  use ExUnit.Case
  doctest KoreanDictionary
  import AssertValue

  describe "We can translate Korean to English" do
    test "한국어" do
      assert_value(
        KoreanDictionary.korean_to_english("한국어") == [
          %{
            translations: [{"Korean; Korean language", "The language used by the Korean people."}],
            word: "한국어"
          }
        ]
      )
    end

    test "벼락치가" do
      assert_value(KoreanDictionary.korean_to_english("벼락치가") == [])
    end

    test "남" do
      assert_value(
        KoreanDictionary.korean_to_english("남") == [
          %{
            translations: [
              {"others; another person", "A person other than me."},
              {"stranger",
               "A person who has no relationship or has broken a relationship with me."}
            ],
            word: "남"
          },
          %{translations: [{"male; man", "A person born as a man."}], word: "남"},
          %{
            translations: [
              {"south",
               "One of four directions, east, west, south, and north, at which the S needle of a compass points."}
            ],
            word: "남"
          },
          %{translations: [{"nam-", "A prefix used to mean a male."}], word: "남-"},
          %{
            translations: [
              {"-nam",
               "(formal, highly addressee-lowering) A sentence-final ending used when asking oneself or complaining about a certain fact."}
            ],
            word: "-남"
          },
          %{translations: [{"-nam", "A suffix used to mean a man."}], word: "-남"},
          %{
            translations: [
              {"persons unrelated to each other",
               "People who are not related to each other, or the relationship between them."}
            ],
            word: "남남"
          },
          %{
            translations: [
              {"leave", "To leave part of something without using it up. "},
              {"make profit", "To cause profits to be made."},
              {"leave; cause to stay",
               "To make something or someone remain where he/she or it was without leaving. "},
              {"leave; hand down",
               "To cause something not to be forgotten, or to be handed down until later. "},
              {"hand down", "To hand down one's property, etc., to posterity. "},
              {"leave; imprint",
               "To cause one's feelings or memory to last without disappearing. "},
              {"leave; cause to occur",
               "To cause something to occur as a result of a certain affair or phenomenon. "},
              {"cause to be left",
               "To fail to fill up a certain amount of time or reach a certain distance. "}
            ],
            word: "남기다"
          },
          %{translations: [{"man and woman", "A man and a woman."}], word: "남녀"},
          %{
            translations: [
              {"remain; be left", "For part of something to remain without being used up. "},
              {"be profitable", "For profits to occur. "},
              {"be left", "For the remainder to occur in doing the division. "},
              {"remain; stay", "To remain where one was without leaving. "},
              {"be left; be remembered", "To not be forgotten. "},
              {"hand down", "To hand down something until later. "},
              {"remain; be left",
               "For a certain state to come to occur as a result of a certain situation. "},
              {"exceed; go beyond", "To go beyond limit. "}
            ],
            word: "남다"
          }
        ]
      )
    end

    test "어렵다" do
      assert_value(
        KoreanDictionary.korean_to_english("어렵다") == [
          %{
            translations: [
              {"difficult; challenging", "Very complicated or hard to do."},
              {"difficult; hard", "Being in serious trouble or suffering great hardship."},
              {"difficult", "Not easy to understand some words or a piece of writing."},
              {"difficult", "Hard to make a living because one is poor."},
              {"difficult", "Fastidious and not well-rounded in personality."},
              {"difficult", "Low in possibility."},
              {"difficult", "Awkward and cautious because one feels distant to someone else."}
            ],
            word: "어렵다"
          }
        ]
      )
    end

    test "예쁘다" do
      assert_value(
        KoreanDictionary.korean_to_english("예쁘다") == [
          %{
            translations: [
              {"pretty; beautiful; comely",
               "The appearance of someone or something looking good and beautiful."},
              {"adorable",
               "One's behavior, movements, way of speaking, etc., being lovely and cute."},
              {"nice; good",
               "A child making one feel satisfied because he/she behaves correctly and does what he/she is told."}
            ],
            word: "예쁘다"
          }
        ]
      )
    end
  end

  describe "We can translate Korean to Korean" do
    test "남" do
      assert_value(
        KoreanDictionary.korean_to_korean("남") == [
          "내가 아닌 다른 사람.",
          "나와 관계가 없거나 관계가 끊어진 사람.",
          "남성으로 태어난 사람.",
          "동서남북의 네 방위 중의 하나로 나침반의 에스 극이 가리키는 쪽."
        ]
      )
    end
  end

  describe "We can translate Korean to English example sentences" do
    test "한국어" do
      assert_value(
        KoreanDictionary.korean_example_sentences("한국어") == [
          "이 오페라는 한국어로 공연한대.",
          "한국어에는 특별한 나이를 가리키는 말이 여럿 있다.",
          "한국어는 강세가 없어서 나는 강세를 가진 언어를 배우는 게 어려웠다.",
          "한국어를 배우는 외국인들은 된소리와 거센소리의 발음을 어려워한다.",
          "내 외국인 친구는 한국에 건너온 지 얼마 되지 않았지만 한국어를 꽤 잘한다.",
          "작년에 제게서 한국어를 배운 일본 학생입니다.",
          "한국인들의 겨레말은 곧 한국어이다.",
          "한국어의 조사 중에서 격을 나타내는 조사를 격 조사라고 한다.",
          "한국어는 주로 조사를 사용하여 문장 내에서 격을 나타낸다.",
          "한국어 격음."
        ]
      )
    end

    test "어렵다" do
      assert_value(
        KoreanDictionary.korean_example_sentences("어렵다") == [
          "가계가 어렵다.",
          "가누기 어렵다.",
          "양 팀의 실력이 비슷해서 오늘 경기는 누가 이길지 가늠이 어렵다.",
          "가늠이 어렵다.",
          "유민이는 어려 보여서 외모만으로 나이를 가늠하기 어렵다.",
          "연구실에 가로놓은 책장 때문에 사람들이 지나다니기 어렵다.",
          "나는 글의 틀린 부분을 가려 바르게 고치는 것이 가장 어렵다.",
          "경제는 가변적이어서 언제 경기가 좋아질지를 정확하게 예측하기 어렵다.",
          "여성들이 직장 일을 하면서 가사를 전담하기란 어렵다.",
          "가산이 어렵다."
        ]
      )
    end

    test "예쁘다" do
      assert_value(
        KoreanDictionary.korean_example_sentences("예쁘다") == [
          "이 반지 참 예쁘다.",
          "그 꽃 가게는 간판에도 꽃 그림이 있어 참 예쁘다.",
          "오늘은 밤하늘이 참 예쁘다.",
          "정말? 나는 동양 사람들의 검은빛 머리가 더 예쁘다고 생각하는데.",
          "지수야, 검지 손가락에 못 보던 반지를 꼈네? 예쁘다.",
          "쑥쓰러워서 겉말로 놀리는 거지. 속으로는 예쁘다고 생각할 거야.",
          "겉모양이 예쁘다.",
          "네 가방 되게 예쁘다.",
          "응, 볼에 찍은 연지 곤지도 너무 예쁘다.",
          "내가 세 살 먹은 고걸 업고 나가면 다들 예쁘다고 만져 봤어요."
        ]
      )
    end
  end
end
