defmodule JdAdmin.Api.ProjectView do
  use JdAdmin.Web, :view

  def render("index.json", %{projects: projects}) do
    %{
      data: render_many(projects, __MODULE__, "project.json", as: :project),
      links: %{
        "self": "http://localhost:4200/projects/"
      }
    }
  end

  def render("show.json", %{project: project}) do
    %{
      data: render_one(project, __MODULE__, "project.json"),
      links: %{
        "self": "http://localhost:4200/projects/#{project.slug}"
      }
    }
  end

  def render("project.json", %{project: project}) do
    %{
      "type": "project",
      "slug": project.slug,
      "attributes": %{
        "title": project.title,
        "featured_image": project.featured_image,
        "excerpt": project.excerpt,
        "body": project.body,
        'project_url': project.project_url,
        "created_at": project.inserted_at,
        "updated_at": project.updated_at
      }
    }
  end
end
