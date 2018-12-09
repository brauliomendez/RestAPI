defmodule TapumaWeb.CarView do
  use TapumaWeb, :view
  alias TapumaWeb.CarView

  def render("index.json", %{car: car}) do
    %{data: render_many(car, CarView, "car.json")}
  end

  def render("show.json", %{car: car}) do
    %{data: render_one(car, CarView, "car.json")}
  end

  def render("car.json", %{car: car}) do
    %{id: car.id,
      model: car.model,
      brand: car.brand,
      year: car.year,
      cylinder: car.cylinder,
      door: car.door,
      hassparetire: car.hassparetire,
      driving: car.driving,
      gas: car.gas,
      passenger: car.passenger,
      capacitytank: car.capacitytank,
      economicnumber: car.economicnumber}
  end
end
