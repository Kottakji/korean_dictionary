defmodule KoreanDictionary.KRDictTest do
  use ExUnit.Case
  alias KoreanDictionary.KRDict
  doctest KoreanDictionary
  import AssertValue

  describe "We can parse the xml for words" do
    test "A single item" do
      xml = File.read!("test/assets/words/single_item.xml")

      assert_value(
        KRDict.get_all_words_from_xml(xml) == [
          {"Korean; Korean language", "The language used by the Korean people."}
        ]
      )
    end

    test "Multiple items" do
      xml = File.read!("test/assets/words/multiple_items.xml")

      assert_value(
        KRDict.get_all_words_from_xml(xml) == [
          {"others; another person", "A person other than me."},
          {"stranger", "A person who has no relationship or has broken a relationship with me."},
          {"male; man", "A person born as a man."},
          {
            "south",
            "One of four directions, east, west, south, and north, at which the S needle of a compass\n                    points.\n                "
          },
          {"nam-", "A prefix used to mean a male."},
          {
            "-nam",
            "(formal, highly addressee-lowering) A sentence-final ending used when asking oneself or\n                    complaining about a certain fact.\n                "
          },
          {"-nam", "A suffix used to mean a man."},
          {
            "persons unrelated to each other",
            "People who are not related to each other, or the relationship between them."
          },
          {"leave", "To leave part of something without using it up."},
          {"make profit", "To cause profits to be made."},
          {
            "leave; cause to stay",
            "To make something or someone remain where he/she or it was without leaving."
          },
          {
            "leave; hand down",
            "To cause something not to be forgotten, or to be handed down until later."
          },
          {"hand down", "To hand down one's property, etc., to posterity."},
          {"leave; imprint", "To cause one's feelings or memory to last without disappearing."},
          {
            "leave; cause to occur",
            "To cause something to occur as a result of a certain affair or phenomenon."
          },
          {
            "cause to be left",
            "To fail to fill up a certain amount of time or reach a certain distance."
          },
          {"man and woman", "A man and a woman."},
          {"remain; be left", "For part of something to remain without being used up."},
          {"be profitable", "For profits to occur."},
          {"be left", "For the remainder to occur in doing the division."},
          {"remain; stay", "To remain where one was without leaving."},
          {"be left; be remembered", "To not be forgotten."},
          {"hand down", "To hand down something until later."},
          {
            "remain; be left",
            "For a certain state to come to occur as a result of a certain situation."
          },
          {"exceed; go beyond", "To go beyond limit."}
        ]
      )
    end

    test "No definition found" do
      xml = File.read!("test/assets/words/no_items.xml")
      assert_value(KRDict.get_all_words_from_xml(xml) == [])
    end
  end

  describe "We can parse the xml for sentences" do
    test "Multiple items" do
      xml = File.read!("test/assets/sentences/multiple_items.xml")

      assert_value(
        KRDict.get_all_sentences_from_xml(xml) == [
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

    test "No definition found" do
      xml = File.read!("test/assets/sentences/no_items.xml")
      assert_value(KRDict.get_all_sentences_from_xml(xml) == [])
    end
  end
end
