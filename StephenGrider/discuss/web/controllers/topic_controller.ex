defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  def new(req, params) do
    IO.puts "++++"
    IO.inspect req #print entire data structure for request connection
    IO.puts "++++"
    IO.inspect params
    IO.puts "++++"
  end
end
