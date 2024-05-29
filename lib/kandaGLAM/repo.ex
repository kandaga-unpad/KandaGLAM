defmodule KandaGLAM.Repo do
  use Ecto.Repo,
    otp_app: :kandaGLAM,
    adapter: Ecto.Adapters.Postgres
end
