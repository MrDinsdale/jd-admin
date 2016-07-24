defmodule JdAdmin.Api.PostController do
  use JdAdmin.Web, :controller

  alias JdAdmin.Post

  def index(conn, _params) do
    posts = Post |> Post.ordered() |> Repo.all()
    render(conn, "index.json", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", post: Repo.get_by!(Post, slug: id))
  end
end
