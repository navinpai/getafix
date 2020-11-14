defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """
  # Comments in Elixir are written with #

  @doc"""
    Creates a deck
  """
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
  
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end
  
  def load(filename) do
    case File.read(filename) do
      # When in doubt, you can treat atoms like strings
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "The file does not exist"
    end
  end

  def create_hand(hand_size) do
    # Pipe Operator ALWAYS sets the output as first parameter of next method
    Cards.create_deck
    |> shuffle
    |> deal(hand_size)
  end
  
  def deal(deck, hand_size) do
    b = shuffle(deck)
    Enum.split(b, hand_size)
  end
end
