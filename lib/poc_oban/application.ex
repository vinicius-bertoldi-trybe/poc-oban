defmodule PocOban.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      PocOban.Repo,
      # Start the Telemetry supervisor
      PocObanWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: PocOban.PubSub},
      # Start the Endpoint (http/https)
      PocObanWeb.Endpoint,
      # Start a worker by calling: PocOban.Worker.start_link(arg)
      # {PocOban.Worker, arg}
      # Start Oban supervisor
      {Oban, Application.fetch_env!(:poc_oban, Oban)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PocOban.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PocObanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
