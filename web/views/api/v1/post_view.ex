defmodule JdAdmin.Api.PostView do
  use JdAdmin.Web, :view
  use JaSerializer.PhoenixView

  attributes [:title, :featured_image, :excerpt, :body, :inserted_at, :updated_at]
end
