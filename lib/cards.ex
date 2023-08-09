# pattern matching is elixir's replacement for variable assignment{}
defmodule Cards do
  @moduledoc """
    Documentation for `Cards`.
  """

  @doc """
  Hello world.

  """
  def create_deck do
    suits = ["♠", "♥", "♦", "♣"]
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

    # ❤️ list comprehension
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Check if contains

  ## Examples
    iex> deck = Cards.create_deck
    iex> Cards.contains? deck, "A of ♠"
    true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file) do
    binary = :erlang.term_to_binary(deck)
    File.write(file, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file doesn't exists"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
