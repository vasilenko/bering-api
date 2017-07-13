defmodule Bering.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :text, :text, null: false
      add :image, :map, null: false
      add :author, :string, null: false
      add :like_count, :integer, null: false, default: 0

      timestamps()
    end

  end
end
