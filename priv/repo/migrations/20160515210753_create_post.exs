defmodule JdAdmin.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :slug, :string
      add :featured_image, :string
      add :excerpt, :string
      add :body, :text

      timestamps
    end

  end
end
