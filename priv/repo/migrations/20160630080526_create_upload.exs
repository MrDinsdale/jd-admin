defmodule JdAdmin.Repo.Migrations.CreateUpload do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :file, :string
      add :name, :string
      add :alt, :string

      timestamps
    end

  end
end
