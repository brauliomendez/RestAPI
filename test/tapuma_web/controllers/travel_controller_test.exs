defmodule TapumaWeb.TravelControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Travels
  alias Tapuma.Travels.Travel

  @create_attrs %{distance: 42, has_more_destinations: true, has_more_origins: true, id_trip: 42, passenger: 42, price: 42, trip_time: 42}
  @update_attrs %{distance: 43, has_more_destinations: false, has_more_origins: false, id_trip: 43, passenger: 43, price: 43, trip_time: 43}
  @invalid_attrs %{distance: nil, has_more_destinations: nil, has_more_origins: nil, id_trip: nil, passenger: nil, price: nil, trip_time: nil}

  def fixture(:travel) do
    {:ok, travel} = Travels.create_travel(@create_attrs)
    travel
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all travels", %{conn: conn} do
      conn = get conn, travel_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create travel" do
    test "renders travel when data is valid", %{conn: conn} do
      conn = post conn, travel_path(conn, :create), travel: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, travel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "distance" => 42,
        "has_more_destinations" => true,
        "has_more_origins" => true,
        "id_trip" => 42,
        "passenger" => 42,
        "price" => 42,
        "trip_time" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, travel_path(conn, :create), travel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update travel" do
    setup [:create_travel]

    test "renders travel when data is valid", %{conn: conn, travel: %Travel{id: id} = travel} do
      conn = put conn, travel_path(conn, :update, travel), travel: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, travel_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "distance" => 43,
        "has_more_destinations" => false,
        "has_more_origins" => false,
        "id_trip" => 43,
        "passenger" => 43,
        "price" => 43,
        "trip_time" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, travel: travel} do
      conn = put conn, travel_path(conn, :update, travel), travel: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete travel" do
    setup [:create_travel]

    test "deletes chosen travel", %{conn: conn, travel: travel} do
      conn = delete conn, travel_path(conn, :delete, travel)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, travel_path(conn, :show, travel)
      end
    end
  end

  defp create_travel(_) do
    travel = fixture(:travel)
    {:ok, travel: travel}
  end
end
