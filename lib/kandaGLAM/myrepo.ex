defmodule KandaGLAM.MyRepo do
  use Ecto.Repo,
    otp_app: :kandaGLAM,
    adapter: Ecto.Adapters.MyXQL
end
