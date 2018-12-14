defmodule TapumaWeb.CarView do
  use TapumaWeb, :view
  alias TapumaWeb.CarView

  def render("index.json", %{cars: cars}) do
    %{data: render_many(cars, CarView, "car.json")}
  end

  def render("show.json", %{car: car}) do
    %{data: render_one(car, CarView, "car.json")}
  end

  def render("car.json", %{car: car}) do
    %{economic_number: car.economic_number,
      model: car.model,
      brand: car.brand,
      year: car.year,
      cylinder: car.cylinder,
      door: car.door,
      has_spare_tire: car.has_spare_tire,
      driving: car.driving,
      gas: car.gas,
      passenger: car.passenger,
      capacity_tank: car.capacity_tank,
      id_owner: car.id_owner,
      id_driver: car.id_driver,
      penalties: render_many(car.penalties, TapumaWeb.PenaltyView, "travel.json")}
  end
end
