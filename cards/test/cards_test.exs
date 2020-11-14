defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "ensure length of deck is 20" do
    assert length(Cards.create_deck) == 20
    # `refute` is the opposite of `assert`
    refute length(Cards.create_deck) == 15
  end
end
