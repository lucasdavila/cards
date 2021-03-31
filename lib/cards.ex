defmodule Cards do
  @moduledoc """
    Provides functions for creating and handling a deck of cards.
  """

  @doc """
    Returns a list of cards strings.
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # for will return a new enumerable with the result of each interation, similar to map in ruby.
    # in this case it is passing two comprehensions, instead of doing a for indise a for.
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Splits a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should be in the hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """
  def deal(deck, hand_size) do
    # split will return a tuple {[selected items], [rest of items]}
    Enum.split(deck, hand_size)
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size) # the first argument, will be the result of the previous call
  end

  @doc """
    Returns if a deck contains a given card.

  ## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Clubs")
      true
      iex> Cards.contains?(deck, "Ace of Foo")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)

    File.write(deck_path(filename), binary)
  end

  def load(filename) do
    # using case with pattern matching, to handle the code is a better approach,
    # instead of using "if status === :ok..."
    case File.read(deck_path(filename)) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, reason} -> "Error on read file: #{reason}"
    end
  end

  def deck_path(filename) do
    "decks/#{filename}.deck"
  end
end
