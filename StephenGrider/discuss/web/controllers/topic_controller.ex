defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  # def new(req, params) do
  #   IO.puts "++++"
  #   IO.inspect req #print entire data structure for request connection
  #   IO.puts "++++"
  #   IO.inspect params
  #   IO.puts "++++"
  # end

  alias Discuss.Topic

  def index(conn, _params) do
    render conn, "index.html"
  end

  def new(connection, params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render connection, "new.html", changeset: changeset
  end

  def create(conn,  params) do
    IO.inspect(params)
    %{"topic"=>topic} = params

    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

end
