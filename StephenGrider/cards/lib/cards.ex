defmodule Cards do
  @moduledoc """
    Provides methodes for creating and handling a deck of cards
  Documentation for Cards.
  """

  @doc """
    Creates and returns a set of strings representing a deck of playing cards.
  """
  def create_deck do
    values = ["Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King"]
    suits = ["Spades","Hearts","Diamonds","Clubs"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  @doc """
    Selects `hand_size` cards from the deck

      ##Examples
        iex> deck = Cards.create_deck
        iex> {hand, _deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Determines whether a card exists within a deck

    ## Examples
    iex> deck = Cards.create_deck
    iex> Cards.contains?(deck, "Ace of Spades")
    true
  """

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def write(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, binary}-> :erlang.binary_to_term binary
      {:error, _reason}-> "Could not find #{filename}"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

  def hello do
    :world
  end


end
