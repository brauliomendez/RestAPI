defmodule TapumaWeb.PenaltyController do
  use TapumaWeb, :controller

  alias Tapuma.Penalties
  alias Tapuma.Penalties.Penalty

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    penalties = Penalties.list_penalties()
    render(conn, "index.json", penalties: penalties)
  end

  def create(conn, %{"penalty" => penalty_params}) do
    with {:ok, %Penalty{} = penalty} <- Penalties.create_penalty(penalty_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", penalty_path(conn, :show, penalty))
      |> render("show.json", penalty: penalty)
    end
  end

  def show(conn, %{"id" => id}) do
    penalty = Penalties.get_penalty!(id)
    render(conn, "show.json", penalty: penalty)
  end

  def update(conn, %{"id" => id, "penalty" => penalty_params}) do
    penalty = Penalties.get_penalty!(id)

    with {:ok, %Penalty{} = penalty} <- Penalties.update_penalty(penalty, penalty_params) do
      render(conn, "show.json", penalty: penalty)
    end
  end

  def delete(conn, %{"id" => id}) do
    penalty = Penalties.get_penalty!(id)
    with {:ok, %Penalty{}} <- Penalties.delete_penalty(penalty) do
      send_resp(conn, :no_content, "")
    end
  end
end
