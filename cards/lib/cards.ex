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
  
  @doc"""
    Checks whether a deck contains a given card

  ## Example

    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    true
  """
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
  
  @doc"""
    Shuffle a deck and then return `hand_size` cards from the deck

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, _} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Clubs"]
  
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def map_example do
    # Note that quotes for keys are optional
    colors = %{primary: "red", secondary: "blue"}
    %{secondary: _} = colors

    Map.put(colors, :primary, "red")
    %{colors | primary: "blue"}
  end

  def keywordlist_example do
    _colors= [{:primary, "red"}, {:secondary, "green"}]
    _colors= [primary: "red", primary: "green"]
    
    # If Keyword list is last argument, you can remove the square braces
  end

end
