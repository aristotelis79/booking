defmodule RsvpWeb.EventController do
  use RsvpWeb, :controller

  def show(conn, %{"id" => id}) do
    event =
      Rsvp.EventQueries.get_by_id(id)
      |> IO.inspect()

    render(conn, "details.html", event: event)
  end
end
