defmodule TapumaWeb.PenaltyControllerTest do
  use TapumaWeb.ConnCase

  alias Tapuma.Penalties
  alias Tapuma.Penalties.Penalty

  @create_attrs %{city: "some city", economic_number: 42, hour: "some hour", id_driver: 42, id_penalty: 42, license: 42, price: 42, street: "some street"}
  @update_attrs %{city: "some updated city", economic_number: 43, hour: "some updated hour", id_driver: 43, id_penalty: 43, license: 43, price: 43, street: "some updated street"}
  @invalid_attrs %{city: nil, economic_number: nil, hour: nil, id_driver: nil, id_penalty: nil, license: nil, price: nil, street: nil}

  def fixture(:penalty) do
    {:ok, penalty} = Penalties.create_penalty(@create_attrs)
    penalty
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all penalties", %{conn: conn} do
      conn = get conn, penalty_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create penalty" do
    test "renders penalty when data is valid", %{conn: conn} do
      conn = post conn, penalty_path(conn, :create), penalty: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, penalty_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "city" => "some city",
        "economic_number" => 42,
        "hour" => "some hour",
        "id_driver" => 42,
        "id_penalty" => 42,
        "license" => 42,
        "price" => 42,
        "street" => "some street"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, penalty_path(conn, :create), penalty: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update penalty" do
    setup [:create_penalty]

    test "renders penalty when data is valid", %{conn: conn, penalty: %Penalty{id: id} = penalty} do
      conn = put conn, penalty_path(conn, :update, penalty), penalty: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, penalty_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "city" => "some updated city",
        "economic_number" => 43,
        "hour" => "some updated hour",
        "id_driver" => 43,
        "id_penalty" => 43,
        "license" => 43,
        "price" => 43,
        "street" => "some updated street"}
    end

    test "renders errors when data is invalid", %{conn: conn, penalty: penalty} do
      conn = put conn, penalty_path(conn, :update, penalty), penalty: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete penalty" do
    setup [:create_penalty]

    test "deletes chosen penalty", %{conn: conn, penalty: penalty} do
      conn = delete conn, penalty_path(conn, :delete, penalty)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, penalty_path(conn, :show, penalty)
      end
    end
  end

  defp create_penalty(_) do
    penalty = fixture(:penalty)
    {:ok, penalty: penalty}
  end
end
