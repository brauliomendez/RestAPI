defmodule TapumaWeb.PassengerController do
  use TapumaWeb, :controller

  alias Tapuma.Passengers
  alias Tapuma.Passengers.Passenger

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    IO.inspect "All"
    passengers = Passengers.list_passengers()
    render(conn, "index.json", passengers: passengers)
  end

  def create(conn, %{"passenger" => passenger_params}) do
    with {:ok, %Passenger{} = passenger} <- Passengers.create_passenger(passenger_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", passenger_path(conn, :show, passenger))
      |> render("show.json", passenger: passenger)
    end
  end

  def show(conn, %{"id" => id}) do
    passenger = Passengers.get_passenger!(id)
    render(conn, "show.json", passenger: passenger)
  end

  def update(conn, %{"id" => id, "passenger" => passenger_params}) do
    passenger = Passengers.get_passenger!(id)

    with {:ok, %Passenger{} = passenger} <- Passengers.update_passenger(passenger, passenger_params) do
      render(conn, "show.json", passenger: passenger)
    end
  end

  def delete(conn, %{"id" => id}) do
    passenger = Passengers.get_passenger!(id)
    with {:ok, %Passenger{}} <- Passengers.delete_passenger(passenger) do
      send_resp(conn, :no_content, "")
    end
  end
end
