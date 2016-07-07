defmodule JdAdmin.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :slug, :string
      add :featured_image, :string
      add :excerpt, :string
      add :body, :text
      add :project_url, :string

      timestamps
    end

  end
end
