defmodule JdAdmin.Repo.Migrations.AddFieldsToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :related_first, :string
      add :related_second, :string
    end
  end
end
