defmodule JdAdmin.File do
  use Arc.Definition
  use Arc.Ecto.Definition

  @acl :public_read
  @versions [:original, :thumb]

  def validate({file, _}) do
    ~w(.jpg .jpeg .gif .png) |> Enum.member?(Path.extname(file.file_name))
  end

  def transform(:original, _file), do: :noaction

  def transform(:thumb, _file) do
    {:convert, "-strip -thumbnail 1280x800^ -gravity center -extent 1280x800"}
  end

  def storage_dir(version, {_, image}) do
    "images/#{version}"
  end

  def filename(_version, {file, _}) do
    Path.rootname(file.file_name)
  end
end
