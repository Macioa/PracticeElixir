defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
 # \ ller, :index
  #end

  scope "/", Discuss do
    pipe_through :browser #default browser

    get "/", PageController, :index
    get "/topics/new", TopicController, :new

    post "/topics", TopicController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end