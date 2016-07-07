defmodule JdAdmin.Post do
  use JdAdmin.Web, :model

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :featured_image, :string
    field :excerpt, :string
    field :body, :string

    timestamps
  end

  @required_fields ~w(title slug excerpt body featured_image)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
