defmodule JdAdmin.Router do
  use JdAdmin.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/", JdAdmin do
    pipe_through :browser

    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/posts", PostController
    resources "/projects", ProjectController
    resources "/users", UserController

    get "/", PageController, :index
  end

  scope "/api/v1", JdAdmin.Api do
    pipe_through :api

    get "/posts", PostController, :index
    get "/posts/:id", PostController, :show

    get "/projects", ProjectController, :index
    get "/projects/:id", ProjectController, :show
  end
end
