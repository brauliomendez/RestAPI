defmodule TapumaWeb.PassengerView do
  use TapumaWeb, :view
  alias TapumaWeb.PassengerView

  def render("index.json", %{passengers: passengers}) do
    %{data: render_many(passengers, PassengerView, "passenger.json")}
  end

  def render("show.json", %{passenger: passenger}) do
    %{data: render_one(passenger, PassengerView, "passenger.json")}
  end

  def render("passenger.json", %{passenger: passenger}) do
    %{id_passenger: passenger.id_passenger,
      phone_home: passenger.phone_home,
      school: passenger.school,
      entry_hour: passenger.entry_hour,
      exit_hour: passenger.exit_hour,
      profile: render_one(passenger.people, TapumaWeb.PeopleView,"people.json")}
  end
end
