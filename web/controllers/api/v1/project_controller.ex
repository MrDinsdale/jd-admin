defmodule JdAdmin.Api.ProjectController do
  use JdAdmin.Web, :controller

  alias JdAdmin.Project
  alias JaSerializer.Params

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.json", data: projects)
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get_by!(Project, slug: id)
    render(conn, "show.json", data: project)
  end
end
