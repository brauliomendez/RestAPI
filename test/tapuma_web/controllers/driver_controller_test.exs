defmodule TapumaWeb.DriverControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Drivers
  alias Tapuma.Drivers.Driver

  @create_attrs %{driver_license: 42, id_driver: 42}
  @update_attrs %{driver_license: 43, id_driver: 43}
  @invalid_attrs %{driver_license: nil, id_driver: nil}

  def fixture(:driver) do
    {:ok, driver} = Drivers.create_driver(@create_attrs)
    driver
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drivers", %{conn: conn} do
      conn = get conn, driver_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver" do
    test "renders driver when data is valid", %{conn: conn} do
      conn = post conn, driver_path(conn, :create), driver: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, driver_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "driver_license" => 42,
        "id_driver" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, driver_path(conn, :create), driver: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver" do
    setup [:create_driver]

    test "renders driver when data is valid", %{conn: conn, driver: %Driver{id: id} = driver} do
      conn = put conn, driver_path(conn, :update, driver), driver: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, driver_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "driver_license" => 43,
        "id_driver" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, driver: driver} do
      conn = put conn, driver_path(conn, :update, driver), driver: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver" do
    setup [:create_driver]

    test "deletes chosen driver", %{conn: conn, driver: driver} do
      conn = delete conn, driver_path(conn, :delete, driver)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, driver_path(conn, :show, driver)
      end
    end
  end

  defp create_driver(_) do
    driver = fixture(:driver)
    {:ok, driver: driver}
  end
end
