# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rsvp.Repo.insert!(%Rsvp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
unless(Rsvp.EventQueries.any()) do
  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(%Rsvp.Events{}, %{
      date: "2020-12-01 00:00:00",
      title: "Elixir Meetup",
      location: "Madrid",
      description: "1rd Meetup"
    })
  )

  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(%Rsvp.Events{}, %{
      date: "2020-12-08 00:00:00",
      title: "Elixir Meetup",
      location: "Amsterdam",
      description: "2rd Meetup"
    })
  )

  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(%Rsvp.Events{}, %{
      date: "2021-01-18 00:00:00",
      title: "Elixir Meetup",
      location: "London",
      description: "3rd Meetup"
    })
  )

  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(%Rsvp.Events{}, %{
      date: "2021-01-29 00:00:00",
      title: "Elixir Meetup",
      location: "Athens",
      description: "4rd Meetup"
    })
  )

  Rsvp.EventQueries.create(
    Rsvp.Events.changeset(%Rsvp.Events{}, %{
      date: "2021-02-08 00:00:00",
      title: "Elixir Meetup",
      location: "Lisbon",
      description: "5rd Meetup"
    })
  )
end
