defmodule Identicon do
    @moduledoc """
  Documentation for Identicon.
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1) #arg = reference to mirror_row function, use instance of mirror_row that takes 1 argument
  end

  def pick_color([r,g,b| tail]=image) do
    %Identicon.Image{ hex: tail, color: {r,g,b} }
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
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
