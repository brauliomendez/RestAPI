defmodule TapumaWeb.TravelController do
  use TapumaWeb, :controller

  alias Tapuma.Travels
  alias Tapuma.Travels.Travel

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    travels = Travels.list_travels()
    render(conn, "index.json", travels: travels)
  end

  def create(conn, %{"travel" => travel_params}) do
    with {:ok, %Travel{} = travel} <- Travels.create_travel(travel_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", travel_path(conn, :show, travel))
      |> render("show.json", travel: travel)
    end
  end

  def show(conn, %{"id" => id}) do
    travel = Travels.get_travel!(id)
    render(conn, "show.json", travel: travel)
  end

  def update(conn, %{"id" => id, "travel" => travel_params}) do
    travel = Travels.get_travel!(id)

    with {:ok, %Travel{} = travel} <- Travels.update_travel(travel, travel_params) do
      render(conn, "show.json", travel: travel)
    end
  end

  def delete(conn, %{"id" => id}) do
    travel = Travels.get_travel!(id)
    with {:ok, %Travel{}} <- Travels.delete_travel(travel) do
      send_resp(conn, :no_content, "")
    end
  end
end
