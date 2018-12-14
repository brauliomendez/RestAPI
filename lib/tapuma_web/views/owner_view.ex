defmodule TapumaWeb.OwnerView do
  use TapumaWeb, :view
  alias TapumaWeb.OwnerView

  def render("index.json", %{owners: owners}) do
    %{data: render_many(owners, OwnerView, "owner.json")}
  end

  def render("show.json", %{owner: owner}) do
    %{data: render_one(owner, OwnerView, "owner.json")}
  end

  def render("owner.json", %{owner: owner}) do
    IO.inspect owner
    %{id_owner: owner.id_owner,
      rfc: owner.rfc,
      profile: render_one(owner.people, TapumaWeb.PeopleView,"people.json"),
      cars: render_many(owner.cars, TapumaWeb.CarView, "car.json")}
  end
end
