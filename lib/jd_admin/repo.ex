defmodule JdAdmin.Repo do
  use Ecto.Repo, otp_app: :jd_admin
  use Scrivener, page_size: 20
end
