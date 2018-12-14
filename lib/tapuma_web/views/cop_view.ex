defmodule TapumaWeb.CopView do
  use TapumaWeb, :view
  alias TapumaWeb.CopView

  def render("index.json", %{cops: cops}) do
    %{data: render_many(cops, CopView, "cop.json")}
  end

  def render("show.json", %{cop: cop}) do
    %{data: render_one(cop, CopView, "cop.json")}
  end

  def render("cop.json", %{cop: cop}) do
    %{license: cop.license,
      first_name: cop.first_name,
      last_name: cop.last_name}
  end
end
