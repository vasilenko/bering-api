defmodule Bering.Router do
  use Bering.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Bering do
    pipe_through :api

    resources "/posts", PostController, except: [:new, :edit]
  end
end
