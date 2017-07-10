defmodule Bering.Router do
  use Bering.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Bering do
    pipe_through :api
  end
end
