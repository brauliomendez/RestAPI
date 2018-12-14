defmodule TapumaWeb.PeopleView do
  use TapumaWeb, :view
  alias TapumaWeb.PeopleView

  def render("index.json", %{people: people}) do
    %{data: render_many(people, PeopleView, "people.json")}
  end

  def render("show.json", %{people: people}) do
    %{data: render_one(people, PeopleView, "people.json")}
  end

  def render("people.json", %{people: people}) do
    %{people_id: people.people_id,
      first_name: people.first_name,
      last_name: people.last_name,
      city: people.city,
      street: people.street,
      number_street: people.number_street,
      zip_code: people.zip_code,
      phone: people.phone,
      picture: people.picture,
      email: people.email,
      date_admission: people.date_admission}
  end
end
