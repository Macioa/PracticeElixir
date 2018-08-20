defmodule Discuss.Repo.Migrations.Discuss do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
    end
  end

end
