defmodule Helloweb.PageController do
  use Helloweb.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
