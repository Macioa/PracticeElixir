defmodule Identicon do
    @moduledoc """
  Documentation for Identicon.
  """
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
    |> draw_image
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill_color = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill_color)
    end

    :egd.render(image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    Enum.map grid, fn({_value, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

    %Identicon.Image{ image | pixel_map: [top_left, bottom_right] }
    end
  end

    @doc """
    Using image hex, break into 3 columns, mirror each row, then return a single list with indexes
  """
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid =
    hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1) #arg = reference to mirror_row function, use instance of mirror_row that takes 1 argument
      |> List.flatten
      |> Enum.with_index
    %Identicon.Image{image | grid: grid}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid}=image) do
    Enum.filter grid, fn({value, _index})->
      rem(value,2)
    end
    %Identicon.Image{image | grid: grid}
  end

  def pick_color([r,g,b| tail]=image) do
    %Identicon.Image{ image | hex: tail, color: {r,g,b} }
  end

  def mirror_row(row) do
    [first, second | _third] = row
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
