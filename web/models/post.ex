defmodule JdAdmin.Post do
  use JdAdmin.Web, :model
  import Ecto.Query

  @primary_key {:slug, :string, []}
  @derive {Phoenix.Param, key: :slug}
  schema "posts" do
    field :title, :string
    field :featured_image, :string
    field :excerpt, :string
    field :body, :string
    field :related_first, :string
    field :related_second, :string
    field :published_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title slug excerpt body featured_image published_at)
  @optional_fields ~w(related_first related_second)

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:slug)
  end

  def ordered(query) do
    query
    |> order_by([p], desc: p.published_at)
  end
end
