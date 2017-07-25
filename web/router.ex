defmodule Bering.Router do
  use Bering.Web, :router

  pipeline :api do
    plug CORSPlug
    plug :accepts, ["json"]
  end

  scope "/", Bering do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
    post "/posts/:id/like", PostController, :like
  end
end
