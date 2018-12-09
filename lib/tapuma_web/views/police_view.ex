defmodule TapumaWeb.PoliceView do
  use TapumaWeb, :view
  alias TapumaWeb.PoliceView

  def render("index.json", %{police: police}) do
    %{data: render_many(police, PoliceView, "police.json")}
  end

  def render("show.json", %{police: police}) do
    %{data: render_one(police, PoliceView, "police.json")}
  end

  def render("police.json", %{police: police}) do
    %{id: police.id,
      license: police.license,
      firstname: police.firstname,
      lastname: police.lastname}
  end
end
