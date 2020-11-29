defmodule Rsvp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Rsvp.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Rsvp.PubSub}
      # Start a worker by calling: Rsvp.Worker.start_link(arg)
      # {Rsvp.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Rsvp.Supervisor)
  end
end
