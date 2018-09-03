defmodule Cowboy2Test do
  use ExUnit.Case
  doctest Cowboy2

  test "greets the world" do
    assert Cowboy2.hello() == :world
  end
end
