defmodule Bering.Repo.Migrations.AllowNullForTextAndImage do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      modify(:text, :text, null: true)
      modify(:image, :map, null: true)
    end
  end
end
