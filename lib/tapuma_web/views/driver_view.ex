defmodule TapumaWeb.DriverView do
  use TapumaWeb, :view
  alias TapumaWeb.DriverView

  def render("index.json", %{drivers: drivers}) do
    %{data: render_many(drivers, DriverView, "driver.json")}
  end

  def render("show.json", %{driver: driver}) do
    %{data: render_one(driver, DriverView, "driver.json")}
  end

  def render("driver.json", %{driver: %{driver_license: driver_license, id_driver: id_driver, people: people, cars: cars}} = driver) do
    IO.inspect driver
    %{id_driver: id_driver,
      driver_license: driver_license,
      profile: render_one(people, TapumaWeb.PeopleView,"people.json"),
      cars: render_many(cars, TapumaWeb.CarView, "car.json")}
  end
end
