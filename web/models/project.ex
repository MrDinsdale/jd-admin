defmodule JdAdmin.Project do
  use JdAdmin.Web, :model

  @primary_key {:slug, :string, []}
  @derive {Phoenix.Param, key: :slug}

  schema "projects" do
    field :title, :string
    field :featured_image, :string
    field :excerpt, :string
    field :project_url, :string
    field :body, :string

    timestamps
  end

  @required_fields ~w(title slug excerpt body featured_image)
  @optional_fields ~w(project_url)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
