defmodule TapumaWeb.OwnerController do
  use TapumaWeb, :controller

  alias Tapuma.Owners
  alias Tapuma.Owners.Owner

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    IO.inspect "All"
    owners = Owners.list_owners()
    render(conn, "index.json", owners: owners)
  end

  def create(conn, %{"owner" => owner_params}) do
    with {:ok, %Owner{} = owner} <- Owners.create_owner(owner_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", owner_path(conn, :show, owner))
      |> render("show.json", owner: owner)
    end
  end

  def show(conn, %{"id" => id}) do
    owner = Owners.get_owner!(id)
    render(conn, "show.json", owner: owner)
  end

  def update(conn, %{"id" => id, "owner" => owner_params}) do
    owner = Owners.get_owner!(id)

    with {:ok, %Owner{} = owner} <- Owners.update_owner(owner, owner_params) do
      render(conn, "show.json", owner: owner)
    end
  end

  def delete(conn, %{"id" => id}) do
    owner = Owners.get_owner!(id)
    with {:ok, %Owner{}} <- Owners.delete_owner(owner) do
      send_resp(conn, :no_content, "")
    end
  end
end
