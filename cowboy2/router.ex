defmodule Cowboy2.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http(Cowboy2.Router, [])
  end

  get "/" do
    conn
      |> send_resp(200, "Plug")
  end



end
