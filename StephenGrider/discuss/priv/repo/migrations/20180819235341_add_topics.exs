defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table("weather") do
      add :title, :string, size:40
    end
  end
end
