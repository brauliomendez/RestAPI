defmodule TapumaWeb.PoliceController do
  use TapumaWeb, :controller

  alias Tapuma.Security
  alias Tapuma.Security.Police

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    police = Security.list_police()
    render(conn, "index.json", police: police)
  end

  def create(conn, %{"police" => police_params}) do
    with {:ok, %Police{} = police} <- Security.create_police(police_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", police_path(conn, :show, police))
      |> render("show.json", police: police)
    end
  end

  def show(conn, %{"id" => id}) do
    police = Security.get_police!(id)
    render(conn, "show.json", police: police)
  end

  def update(conn, %{"id" => id, "police" => police_params}) do
    police = Security.get_police!(id)

    with {:ok, %Police{} = police} <- Security.update_police(police, police_params) do
      render(conn, "show.json", police: police)
    end
  end

  def delete(conn, %{"id" => id}) do
    police = Security.get_police!(id)
    with {:ok, %Police{}} <- Security.delete_police(police) do
      send_resp(conn, :no_content, "")
    end
  end
end
