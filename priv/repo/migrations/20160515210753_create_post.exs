defmodule JdAdmin.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :slug, :string, primary_key: true
      add :title, :string
      add :featured_image, :string
      add :excerpt, :string
      add :body, :text

      timestamps
    end

  end
end
