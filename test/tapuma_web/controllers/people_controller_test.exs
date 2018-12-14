defmodule TapumaWeb.PeopleControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Users
  alias Tapuma.Users.People

  @create_attrs %{city: "some city", date_admission: ~D[2010-04-17], email: "some email", first_name: "some first_name", people_id: 42, last_name: "some last_name", number_street: 42, phone: "some phone", picture: "some picture", street: "some street", zip_code: 42}
  @update_attrs %{city: "some updated city", date_admission: ~D[2011-05-18], email: "some updated email", first_name: "some updated first_name", people_id: 43, last_name: "some updated last_name", number_street: 43, phone: "some updated phone", picture: "some updated picture", street: "some updated street", zip_code: 43}
  @invalid_attrs %{city: nil, date_admission: nil, email: nil, first_name: nil, people_id: nil, last_name: nil, number_street: nil, phone: nil, picture: nil, street: nil, zip_code: nil}

  def fixture(:people) do
    {:ok, people} = Users.create_people(@create_attrs)
    people
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all people", %{conn: conn} do
      conn = get conn, people_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create people" do
    test "renders people when data is valid", %{conn: conn} do
      conn = post conn, people_path(conn, :create), people: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, people_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "city" => "some city",
        "date_admission" => ~D[2010-04-17],
        "email" => "some email",
        "first_name" => "some first_name",
        "people_id" => 42,
        "last_name" => "some last_name",
        "number_street" => 42,
        "phone" => "some phone",
        "picture" => "some picture",
        "street" => "some street",
        "zip_code" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, people_path(conn, :create), people: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update people" do
    setup [:create_people]

    test "renders people when data is valid", %{conn: conn, people: %People{id: id} = people} do
      conn = put conn, people_path(conn, :update, people), people: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, people_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "city" => "some updated city",
        "date_admission" => ~D[2011-05-18],
        "email" => "some updated email",
        "first_name" => "some updated first_name",
        "people_id" => 43,
        "last_name" => "some updated last_name",
        "number_street" => 43,
        "phone" => "some updated phone",
        "picture" => "some updated picture",
        "street" => "some updated street",
        "zip_code" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, people: people} do
      conn = put conn, people_path(conn, :update, people), people: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete people" do
    setup [:create_people]

    test "deletes chosen people", %{conn: conn, people: people} do
      conn = delete conn, people_path(conn, :delete, people)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, people_path(conn, :show, people)
      end
    end
  end

  defp create_people(_) do
    people = fixture(:people)
    {:ok, people: people}
  end
end
