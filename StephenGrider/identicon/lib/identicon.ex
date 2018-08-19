defmodule Identicon do
    @moduledoc """
      Documentation for Identicon.
    """
  def main(input) do
    input
      |>hash_input
      |>pick_color
      |>build_grid
      |>filter_odd_squares
      |>build_pixel_map
      |>draw_image
      |>save_image(input)
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill_color = :egd.color(color)

    Enum.each pixel_map, fn({start, stop}) ->
      :egd.filledRectangle(image, start, stop, fill_color)
    end

    :egd.render(image)
  end

  def save_image(image, input) do
    File.write("#{input}.png", image)
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map = Enum.map grid, fn({_value, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end
    %Identicon.Image{image | pixel_map: pixel_map}
  end

    @doc """
    From image hex, break into 3 columns, mirror each row, then return a single list with indexes
    ## Examples
      iex> id = Identicon.pick_color([164, 140, 170, 144, 146, 152, 141, 117, 180, 193, 241, 190, 132, 212, 64, 88])
      iex> Identicon.build_grid(id)
      %Identicon.Image{
        color: {164, 140, 170},
        grid: [
          {144, 0},
          {146, 1},
          {152, 2},
          {146, 3},
          {144, 4},
          {141, 5},
          {117, 6},
          {180, 7},
          {117, 8},
          {141, 9},
          {193, 10},
          {241, 11},
          {190, 12},
          {241, 13},
          {193, 14},
          {132, 15},
          {212, 16},
          {64, 17},
          {212, 18},
          {132, 19}
        ],
        hex: [144, 146, 152, 141, 117, 180, 193, 241, 190, 132, 212, 64, 88],
        pixel_map: nil
      }
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
    grid = Enum.filter grid, fn({value, _index})->
      rem(value,2) == 0
    end
    %Identicon.Image{image | grid: grid}
  end

  @doc """
  Hash input
  ## Examples
      iex> Identicon.pick_color([164, 140, 170, 144, 146, 152, 141, 117, 180, 193, 241, 190, 132, 212, 64, 88])
      %Identicon.Image{
        color: {164, 140, 170},
        grid: nil,
        hex: [144, 146, 152, 141, 117, 180, 193, 241, 190, 132, 212, 64, 88],
        pixel_map: nil
      }
  """
  def pick_color(hex) do
    [r,g,b | tail] = hex
    %Identicon.Image{ hex: tail,  color: {r,g,b} }
  end

  def mirror_row(row) do
    [first, second | _third] = row
    row ++ [second, first]
  end


  @doc """
  Hash input
  ## Examples
      iex> Identicon.hash_input('sampleinput')
      [164, 140, 170, 144, 146, 152, 141, 117, 180, 193, 241, 190, 132, 212, 64, 88]
  """
  def hash_input(input) do
    :crypto.hash(:md5, input)
    |> :binary.bin_to_list
  end

end
