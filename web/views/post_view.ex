defmodule Bering.PostView do
  use Bering.Web, :view

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, Bering.PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, Bering.PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    %{
      id: post.id,
      title: post.title,
      text: post.text,
      image: post.image,
      meta: %{
        author: post.author,
        like_count: post.like_count,
        created_at: post.inserted_at,
        updated_at: post.updated_at
      }
    }
  end
end
