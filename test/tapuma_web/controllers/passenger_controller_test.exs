defmodule TapumaWeb.PassengerControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Passengers
  alias Tapuma.Passengers.Passenger

  @create_attrs %{entry_hour: "some entry_hour", exit_hour: "some exit_hour", id_passenger: 42, phone_home: "some phone_home", school: "some school"}
  @update_attrs %{entry_hour: "some updated entry_hour", exit_hour: "some updated exit_hour", id_passenger: 43, phone_home: "some updated phone_home", school: "some updated school"}
  @invalid_attrs %{entry_hour: nil, exit_hour: nil, id_passenger: nil, phone_home: nil, school: nil}

  def fixture(:passenger) do
    {:ok, passenger} = Passengers.create_passenger(@create_attrs)
    passenger
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all passengers", %{conn: conn} do
      conn = get conn, passenger_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create passenger" do
    test "renders passenger when data is valid", %{conn: conn} do
      conn = post conn, passenger_path(conn, :create), passenger: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, passenger_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "entry_hour" => "some entry_hour",
        "exit_hour" => "some exit_hour",
        "id_passenger" => 42,
        "phone_home" => "some phone_home",
        "school" => "some school"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, passenger_path(conn, :create), passenger: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update passenger" do
    setup [:create_passenger]

    test "renders passenger when data is valid", %{conn: conn, passenger: %Passenger{id: id} = passenger} do
      conn = put conn, passenger_path(conn, :update, passenger), passenger: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, passenger_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "entry_hour" => "some updated entry_hour",
        "exit_hour" => "some updated exit_hour",
        "id_passenger" => 43,
        "phone_home" => "some updated phone_home",
        "school" => "some updated school"}
    end

    test "renders errors when data is invalid", %{conn: conn, passenger: passenger} do
      conn = put conn, passenger_path(conn, :update, passenger), passenger: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete passenger" do
    setup [:create_passenger]

    test "deletes chosen passenger", %{conn: conn, passenger: passenger} do
      conn = delete conn, passenger_path(conn, :delete, passenger)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, passenger_path(conn, :show, passenger)
      end
    end
  end

  defp create_passenger(_) do
    passenger = fixture(:passenger)
    {:ok, passenger: passenger}
  end
end
