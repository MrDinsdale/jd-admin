defmodule :"Elixir.JdAdmin.Api.v1.Project"ControllerTest do
  use JdAdmin.ConnCase

  alias :"Elixir.JdAdmin.Api.v1.Project"
  alias JdAdmin.Repo

  @valid_attrs %{body: "some content", excerpt: "some content", featured_image: "some content", project_url: "some content", slug: "some content", title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end
  
  defp relationships do
    %{}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, project_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    project = Repo.insert! %Project"{}
    conn = get conn, project_path(conn, :show, project)
    data = json_response(conn, 200)["data"]
    assert data["id"] == "#{project.id}"
    assert data["type"] == "project"
    assert data["attributes"]["title"] == project.title
    assert data["attributes"]["slug"] == project.slug
    assert data["attributes"]["featured_image"] == project.featured_image
    assert data["attributes"]["excerpt"] == project.excerpt
    assert data["attributes"]["project_url"] == project.project_url
    assert data["attributes"]["body"] == project.body
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, project_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, project_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "project",
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Project", @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, project_path(conn, :create), %{
      "meta" => %{},
      "data" => %{
        "type" => "project",
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    project = Repo.insert! %Project"{}
    conn = put conn, project_path(conn, :update, project), %{
      "meta" => %{},
      "data" => %{
        "type" => "project",
        "id" => project.id,
        "attributes" => @valid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Project", @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    project = Repo.insert! %Project"{}
    conn = put conn, project_path(conn, :update, project), %{
      "meta" => %{},
      "data" => %{
        "type" => "project",
        "id" => project.id,
        "attributes" => @invalid_attrs,
        "relationships" => relationships
      }
    }

    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    project = Repo.insert! %Project"{}
    conn = delete conn, project_path(conn, :delete, project)
    assert response(conn, 204)
    refute Repo.get(Project", project.id)
  end

end
