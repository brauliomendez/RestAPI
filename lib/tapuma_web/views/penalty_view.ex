defmodule TapumaWeb.PenaltyView do
  use TapumaWeb, :view
  alias TapumaWeb.PenaltyView

  def render("index.json", %{penalties: penalties}) do
    %{data: render_many(penalties, PenaltyView, "penalty.json")}
  end

  def render("show.json", %{penalty: penalty}) do
    %{data: render_one(penalty, PenaltyView, "penalty.json")}
  end

  def render("penalty.json", %{penalty: penalty}) do
    %{id_penalty: penalty.id_penalty,
      city: penalty.city,
      street: penalty.street,
      hour: penalty.hour,
      price: penalty.price,
      license: penalty.license,
      id_driver: penalty.id_driver,
      economic_number: penalty.economic_number}
  end
end
