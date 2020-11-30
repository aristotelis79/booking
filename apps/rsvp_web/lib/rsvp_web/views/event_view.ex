defmodule RsvpWeb.EventView do
  use RsvpWeb, :view

  def format_date(date) do
    "#{date.day}/#{date.month}/#{date.year} #{date.hour}:#{date.minute}"
  end
end
