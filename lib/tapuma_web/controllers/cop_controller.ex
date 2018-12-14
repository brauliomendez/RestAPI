defmodule TapumaWeb.CopController do
  use TapumaWeb, :controller

  alias Tapuma.Cops
  alias Tapuma.Cops.Cop

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    IO.inspect "All"
    cops = Cops.list_cops()
    render(conn, "index.json", cops: cops)
  end

  def create(conn, %{"cop" => cop_params}) do
    with {:ok, %Cop{} = cop} <- Cops.create_cop(cop_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", cop_path(conn, :show, cop))
      |> render("show.json", cop: cop)
    end
  end

  def show(conn, %{"id" => id}) do
    cop = Cops.get_cop!(id)
    render(conn, "show.json", cop: cop)
  end

  def update(conn, %{"id" => id, "cop" => cop_params}) do
    cop = Cops.get_cop!(id)

    with {:ok, %Cop{} = cop} <- Cops.update_cop(cop, cop_params) do
      render(conn, "show.json", cop: cop)
    end
  end

  def delete(conn, %{"id" => id}) do
    cop = Cops.get_cop!(id)
    with {:ok, %Cop{}} <- Cops.delete_cop(cop) do
      send_resp(conn, :no_content, "")
    end
  end
end
