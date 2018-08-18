defmodule Identicon do
    @moduledoc """
  Documentation for Identicon.
  """
  def main(input) do
    input
    |> hash_input
  end

  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list

  end





  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """

  def hello do
    :world
  end
end
