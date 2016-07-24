defmodule JdAdmin.Repo.Migrations.AddPublishedAtFieldToPosts do
  use Ecto.Migration
  import Ecto.DateTime

  def change do
    alter table(:posts) do
      add :published_at, :datetime
    end
  end
end
