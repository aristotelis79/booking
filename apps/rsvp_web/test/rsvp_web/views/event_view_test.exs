defmodule RsvpWeb.EventViewTest do
  use RsvpWeb.ConCase, async: true

  @tag current: true
  test "Shoud convert a date to M/D/YY dormat" do
    date = DateTime("2020-12-01 01:02:03.00000Z")
    formated = Rsvp.EventView.format_date(date)
    assert formatted == "01/12/2020"
  end
end
