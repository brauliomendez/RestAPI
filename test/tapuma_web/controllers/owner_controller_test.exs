defmodule TapumaWeb.OwnerControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Owners
  alias Tapuma.Owners.Owner

  @create_attrs %{RFC: "some RFC", id_owner: 42}
  @update_attrs %{RFC: "some updated RFC", id_owner: 43}
  @invalid_attrs %{RFC: nil, id_owner: nil}

  def fixture(:owner) do
    {:ok, owner} = Owners.create_owner(@create_attrs)
    owner
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all owners", %{conn: conn} do
      conn = get conn, owner_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create owner" do
    test "renders owner when data is valid", %{conn: conn} do
      conn = post conn, owner_path(conn, :create), owner: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, owner_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "RFC" => "some RFC",
        "id_owner" => 42}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, owner_path(conn, :create), owner: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update owner" do
    setup [:create_owner]

    test "renders owner when data is valid", %{conn: conn, owner: %Owner{id: id} = owner} do
      conn = put conn, owner_path(conn, :update, owner), owner: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, owner_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "RFC" => "some updated RFC",
        "id_owner" => 43}
    end

    test "renders errors when data is invalid", %{conn: conn, owner: owner} do
      conn = put conn, owner_path(conn, :update, owner), owner: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete owner" do
    setup [:create_owner]

    test "deletes chosen owner", %{conn: conn, owner: owner} do
      conn = delete conn, owner_path(conn, :delete, owner)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, owner_path(conn, :show, owner)
      end
    end
  end

  defp create_owner(_) do
    owner = fixture(:owner)
    {:ok, owner: owner}
  end
end
