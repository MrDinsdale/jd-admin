defmodule :"Elixir.JdAdmin.Api.v1.Project"Test do
  use JdAdmin.ModelCase

  alias :"Elixir.JdAdmin.Api.v1.Project"

  @valid_attrs %{body: "some content", excerpt: "some content", featured_image: "some content", project_url: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project".changeset(%Project"{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project".changeset(%Project"{}, @invalid_attrs)
    refute changeset.valid?
  end
end
