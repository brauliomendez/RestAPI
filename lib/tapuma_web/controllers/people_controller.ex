defmodule TapumaWeb.PeopleController do
  use TapumaWeb, :controller

  alias Tapuma.Users
  alias Tapuma.Users.People

  action_fallback TapumaWeb.FallbackController

  def index(conn, _params) do
    people = Users.list_people()
    render(conn, "index.json", people: people)
  end

  def create(conn, %{"people" => people_params}) do
    with {:ok, %People{} = people} <- Users.create_people(people_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", people_path(conn, :show, people))
      |> render("show.json", people: people)
    end
  end

  def show(conn, %{"id" => id}) do
    people = Users.get_people!(id)
    render(conn, "show.json", people: people)
  end

  def update(conn, %{"id" => id, "people" => people_params}) do
    people = Users.get_people!(id)

    with {:ok, %People{} = people} <- Users.update_people(people, people_params) do
      render(conn, "show.json", people: people)
    end
  end

  def delete(conn, %{"id" => id}) do
    people = Users.get_people!(id)
    with {:ok, %People{}} <- Users.delete_people(people) do
      send_resp(conn, :no_content, "")
    end
  end
end
