defmodule RsvpWeb.Router do
  use RsvpWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

#  pipeline :authorized do
#    plug :browser
#    plug RsvpWeb.AuthorizedPlug
#  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RsvpWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/events", EventController, :list
    get "/events/new", EventController, :create
    post "/events/new", EventController, :add
    get "/events/:id", EventController, :show

    get "/login", LoginController, :index
    post "/login", LoginController, :login
  end

  # Other scopes may use custom stacks.
  # scope "/api", RsvpWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: RsvpWeb.Telemetry
    end
  end
end
