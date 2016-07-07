defmodule JdAdmin.Api.ProjectView do
  use JdAdmin.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :slug, :featured_image, :excerpt, :project_url, :body, :inserted_at, :updated_at]
end
