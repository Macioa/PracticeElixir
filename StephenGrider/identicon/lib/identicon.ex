defmodule Identicon do
    @moduledoc """
  Documentation for Identicon.
  """
  def main(input) do
    input
    |> hash_input
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
  end

  def pick_color(%Identicon.Image{hex: hex_list} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
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
