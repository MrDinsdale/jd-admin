defmodule JdAdmin.File do
  use Arc.Definition
  use Arc.Ecto.Definition

  @versions [:original, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png)

  @acl :public_read

  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname |> String.downcase
    Enum.member?(@extension_whitelist, file_extension)
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 1200x800^ -gravity center -extent 1200x800 -format png", :png}
  end

  def filename(version, _) do
    version
  end

  def storage_dir(_, {file, file}) do
    "uploads/files/#{file.id}"
  end

  # def default_url(version, file) do
  #   "/images/avatars/default_#{version}.png"
  # end

  def s3_object_headers(version, {file, file}) do
    [content_type: Plug.MIME.path(file.file_name)]
  end
end
