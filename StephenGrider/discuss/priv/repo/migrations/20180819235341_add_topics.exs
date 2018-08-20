defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    add :title, :string
  end
end
