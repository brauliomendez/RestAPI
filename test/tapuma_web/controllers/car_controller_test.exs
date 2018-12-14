defmodule TapumaWeb.CarControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Cars
  alias Tapuma.Cars.Car

  @create_attrs %{brand: "some brand", capacity_tank: 42, cylinder: 42, door: 42, driving: "some driving", economic_number: 42, gas: "some gas", has_spare_tire: true, id_driver: 42, id_owner: 42, model: "some model", passenger: 42, year: 42}
  @update_attrs %{brand: "some updated brand", capacity_tank: 43, cylinder: 43, door: 43, driving: "some updated driving", economic_number: 43, gas: "some updated gas", has_spare_tire: false, id_driver: 43, id_owner: 43, model: "some updated model", passenger: 43, year: 43}
  @invalid_attrs %{brand: nil, capacity_tank: nil, cylinder: nil, door: nil, driving: nil, economic_number: nil, gas: nil, has_spare_tire: nil, id_driver: nil, id_owner: nil, model: nil, passenger: nil, year: nil}

  def fixture(:car) do
    {:ok, car} = Cars.create_car(@create_attrs)
    car
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cars", %{conn: conn} do
      conn = get conn, car_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create car" do
    test "renders car when data is valid", %{conn: conn} do
      conn = post conn, car_path(conn, :create), car: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, car_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "brand" => "some brand",
        "capacity_tank" => 42,
        "cylinder" => 42,
        "door" => 42,
        "driving" => "some driving",
        "economic_number" => 42,
        "gas" => "some gas",
        "has_spare_tire" => true,
        "id_driver" => 42,
        "id_owner" => 42,
        "model" => "some model",
        "passenger" => 42,
        "year" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, car_path(conn, :create), car: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update car" do
    setup [:create_car]

    test "renders car when data is valid", %{conn: conn, car: %Car{id: id} = car} do
      conn = put conn, car_path(conn, :update, car), car: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, car_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "brand" => "some updated brand",
        "capacity_tank" => 43,
        "cylinder" => 43,
        "door" => 43,
        "driving" => "some updated driving",
        "economic_number" => 43,
        "gas" => "some updated gas",
        "has_spare_tire" => false,
        "id_driver" => 43,
        "id_owner" => 43,
        "model" => "some updated model",
        "passenger" => 43,
        "year" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, car: car} do
      conn = put conn, car_path(conn, :update, car), car: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete car" do
    setup [:create_car]

    test "deletes chosen car", %{conn: conn, car: car} do
      conn = delete conn, car_path(conn, :delete, car)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, car_path(conn, :show, car)
      end
    end
  end

  defp create_car(_) do
    car = fixture(:car)
    {:ok, car: car}
  end
end
