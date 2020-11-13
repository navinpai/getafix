defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  # Comments in Elixir are written with #

  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Clubs", "Hearts", "Diamonds", "Spades"]
    
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end
  
  def shuffle(deck) do
    Enum.shuffle(deck) 
  end
  
  def contains?(deck, card) do
    Enum.member?(deck, card) 
  end
  
  def deal(deck, hand_size) do
    b = shuffle(deck)
    Enum.split(b, hand_size)
  end
end
