defmodule Bering.Release.Tasks do
  def migrate do
    {:ok, _} = Application.ensure_all_started(:bering)

    path = Application.app_dir(:bering, "priv/repo/migrations")
    Ecto.Migrator.run(Bering.Repo, path, :up, all: true)

    Bering.Repo |> GenServer.whereis() |> Bering.Repo.stop()
  end
end
