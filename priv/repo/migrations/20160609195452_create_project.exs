defmodule JdAdmin.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects, primary_key: false) do
      add :slug, :string, primary_key: true
      add :title, :string
      add :featured_image, :string
      add :excerpt, :string
      add :body, :text
      add :project_url, :string

      timestamps
    end

  end
end
