defmodule Bering.Repo do
  use Ecto.Repo, otp_app: :bering
  use Scrivener, page_size: 10
end
