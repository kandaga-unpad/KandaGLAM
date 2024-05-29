defmodule KandaGLAM.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      KandaGLAMWeb.Telemetry,
      KandaGLAM.Repo,
      # KandaGLAM.MyRepo,
      {DNSCluster, query: Application.get_env(:kandaGLAM, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: KandaGLAM.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: KandaGLAM.Finch},
      # Start a worker by calling: KandaGLAM.Worker.start_link(arg)
      # {KandaGLAM.Worker, arg},
      # Start to serve requests, typically the last entry
      KandaGLAMWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KandaGLAM.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KandaGLAMWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
