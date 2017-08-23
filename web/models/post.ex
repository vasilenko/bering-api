defmodule Bering.Post do
  use Bering.Web, :model

  schema "posts" do
    field :title, :string
    field :text, :string
    field :author, :string
    field :like_count, :integer, default: 0

    embeds_one :image, Image, on_replace: :delete do
      field :src, :string
      field :width, :integer
      field :height, :integer
      field :alt, :string
    end

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :text, :author, :like_count])
    |> cast_embed(:image, with: &image_changeset/2)
    |> validate_required([:title, :author])
  end

  defp image_changeset(image, params) do
    image
    |> cast(params, [:src, :width, :height, :alt])
    |> validate_required([:src])
  end
end
