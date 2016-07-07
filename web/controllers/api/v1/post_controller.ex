defmodule JdAdmin.Api.PostController do
  use JdAdmin.Web, :controller

  alias JdAdmin.Post
  alias JaSerializer.Params

  def index(conn, params) do
    posts = Repo.all(Post)
    # page = JdAdmin.Repo.paginate(Post, params["page"])
    render(conn, "index.json", data: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get_by!(Post, slug: id)
    render(conn, "show.json", data: post)
  end
end
