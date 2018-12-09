defmodule TapumaWeb.PoliceControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Security
  alias Tapuma.Security.Police

  @create_attrs %{firstname: "some firstname", id: 42, lastname: "some lastname", license: 42}
  @update_attrs %{firstname: "some updated firstname", id: 43, lastname: "some updated lastname", license: 43}
  @invalid_attrs %{firstname: nil, id: nil, lastname: nil, license: nil}

  def fixture(:police) do
    {:ok, police} = Security.create_police(@create_attrs)
    police
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all police", %{conn: conn} do
      conn = get conn, police_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create police" do
    test "renders police when data is valid", %{conn: conn} do
      conn = post conn, police_path(conn, :create), police: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, police_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "firstname" => "some firstname",
        "id" => 42,
        "lastname" => "some lastname",
        "license" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, police_path(conn, :create), police: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update police" do
    setup [:create_police]

    test "renders police when data is valid", %{conn: conn, police: %Police{id: id} = police} do
      conn = put conn, police_path(conn, :update, police), police: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, police_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "firstname" => "some updated firstname",
        "id" => 43,
        "lastname" => "some updated lastname",
        "license" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, police: police} do
      conn = put conn, police_path(conn, :update, police), police: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete police" do
    setup [:create_police]

    test "deletes chosen police", %{conn: conn, police: police} do
      conn = delete conn, police_path(conn, :delete, police)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, police_path(conn, :show, police)
      end
    end
  end

  defp create_police(_) do
    police = fixture(:police)
    {:ok, police: police}
  end
end
