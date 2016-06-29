defmodule JdAdmin.Api.ProjectView do
  use JdAdmin.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, __MODULE__, "project.json", as: :project)}
  end

  def render("show.json", %{project: project}) do
    %{data:
      %{
        "type": "project",
        "id": project.id,
        "attributes": %{
          "title": project.title,
          "slug": project.slug,
          "excerpt": project.excerpt,
          "body": project.body,
          'project_url': project.project_url,
          "created_at": project.inserted_at,
          "updated_at": project.updated_at
        }
      }
    }
  end

  def render("project.json", %{project: project}) do
    %{
      "type": "project",
      "id": project.id,
      "attributes": %{
        "title": project.title,
        "slug": project.slug,
        "excerpt": project.excerpt,
        "body": project.body,
        'project_url': project.project_url,
        "created_at": project.inserted_at,
        "updated_at": project.updated_at
      }
    }
  end
end
