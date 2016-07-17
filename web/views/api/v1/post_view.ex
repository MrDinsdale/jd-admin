defmodule JdAdmin.Api.PostView do
  use JdAdmin.Web, :view

  def render("index.json", %{posts: posts}) do
    %{
      data: render_many(posts, __MODULE__, "post.json", as: :post),
      links: %{
        "self": "http://localhost:4200/posts/"
      }
    }
  end

  def render("show.json", %{post: post}) do
    %{
      data: render_one(post, __MODULE__, "post.json"),
      links: %{
        "self": "http://localhost:4200/posts/#{post.slug}"
      }
    }
  end

  def render("post.json", %{post: post}) do
     %{
      "type": "post",
      "slug": post.slug,
      "attributes": %{
        "title": post.title,
        "featured_image": post.featured_image,
        "excerpt": post.excerpt,
        "body": post.body,
        "created_at": post.inserted_at,
        "updated_at": post.updated_at,
        "related": %{
          "first": post.related_first,
          "second": post.related_second,
        }
      }
    }
  end
end
