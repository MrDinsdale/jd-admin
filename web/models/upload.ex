defmodule JdAdmin.Upload do
  use JdAdmin.Web, :model
  use Arc.Ecto.Model

  alias JdAdmin.Uploaders

  schema "uploads" do
    field :file, JdAdmin.File.Type
    field :name, :string
    field :alt, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(alt)

  @required_file_fields ~w(file)
  @optional_file_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end
end
