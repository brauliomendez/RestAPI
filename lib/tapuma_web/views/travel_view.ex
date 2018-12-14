defmodule TapumaWeb.TravelView do
  use TapumaWeb, :view
  alias TapumaWeb.TravelView

  def render("index.json", %{travels: travels}) do
    %{data: render_many(travels, TravelView, "travel.json")}
  end

  def render("show.json", %{travel: travel}) do
    %{data: render_one(travel, TravelView, "travel.json")}
  end

  def render("travel.json", %{travel: travel}) do
    %{id_trip: travel.id_trip,
      passenger: travel.passenger,
      has_more_origins: travel.has_more_origins,
      has_more_destinations: travel.has_more_destinations,
      trip_time: travel.trip_time,
      distance: travel.distance,
      price: travel.price}
  end
end
