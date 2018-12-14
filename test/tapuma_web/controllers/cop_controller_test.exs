defmodule TapumaWeb.CopControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Cops
  alias Tapuma.Cops.Cop

  @create_attrs %{first_name: "some first_name", last_name: "some last_name", license: 42}
  @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", license: 43}
  @invalid_attrs %{first_name: nil, last_name: nil, license: nil}

  def fixture(:cop) do
    {:ok, cop} = Cops.create_cop(@create_attrs)
    cop
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cops", %{conn: conn} do
      conn = get conn, cop_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cop" do
    test "renders cop when data is valid", %{conn: conn} do
      conn = post conn, cop_path(conn, :create), cop: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cop_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "first_name" => "some first_name",
        "last_name" => "some last_name",
        "license" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cop_path(conn, :create), cop: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cop" do
    setup [:create_cop]

    test "renders cop when data is valid", %{conn: conn, cop: %Cop{id: id} = cop} do
      conn = put conn, cop_path(conn, :update, cop), cop: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cop_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "first_name" => "some updated first_name",
        "last_name" => "some updated last_name",
        "license" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, cop: cop} do
      conn = put conn, cop_path(conn, :update, cop), cop: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cop" do
    setup [:create_cop]

    test "deletes chosen cop", %{conn: conn, cop: cop} do
      conn = delete conn, cop_path(conn, :delete, cop)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cop_path(conn, :show, cop)
      end
    end
  end

  defp create_cop(_) do
    cop = fixture(:cop)
    {:ok, cop: cop}
  end
end
