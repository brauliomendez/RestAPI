defmodule Tapuma.PenaltiesTest do
  use Tapuma.DataCase

  alias Tapuma.Penalties

  describe "penalties" do
    alias Tapuma.Penalties.Penalty

    @valid_attrs %{city: "some city", economic_number: 42, hour: "some hour", id_driver: 42, id_penalty: 42, license: 42, price: 42, street: "some street"}
    @update_attrs %{city: "some updated city", economic_number: 43, hour: "some updated hour", id_driver: 43, id_penalty: 43, license: 43, price: 43, street: "some updated street"}
    @invalid_attrs %{city: nil, economic_number: nil, hour: nil, id_driver: nil, id_penalty: nil, license: nil, price: nil, street: nil}

    def penalty_fixture(attrs \\ %{}) do
      {:ok, penalty} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Penalties.create_penalty()

      penalty
    end

    test "list_penalties/0 returns all penalties" do
      penalty = penalty_fixture()
      assert Penalties.list_penalties() == [penalty]
    end

    test "get_penalty!/1 returns the penalty with given id" do
      penalty = penalty_fixture()
      assert Penalties.get_penalty!(penalty.id) == penalty
    end

    test "create_penalty/1 with valid data creates a penalty" do
      assert {:ok, %Penalty{} = penalty} = Penalties.create_penalty(@valid_attrs)
      assert penalty.city == "some city"
      assert penalty.economic_number == 42
      assert penalty.hour == "some hour"
      assert penalty.id_driver == 42
      assert penalty.id_penalty == 42
      assert penalty.license == 42
      assert penalty.price == 42
      assert penalty.street == "some street"
    end

    test "create_penalty/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Penalties.create_penalty(@invalid_attrs)
    end

    test "update_penalty/2 with valid data updates the penalty" do
      penalty = penalty_fixture()
      assert {:ok, penalty} = Penalties.update_penalty(penalty, @update_attrs)
      assert %Penalty{} = penalty
      assert penalty.city == "some updated city"
      assert penalty.economic_number == 43
      assert penalty.hour == "some updated hour"
      assert penalty.id_driver == 43
      assert penalty.id_penalty == 43
      assert penalty.license == 43
      assert penalty.price == 43
      assert penalty.street == "some updated street"
    end

    test "update_penalty/2 with invalid data returns error changeset" do
      penalty = penalty_fixture()
      assert {:error, %Ecto.Changeset{}} = Penalties.update_penalty(penalty, @invalid_attrs)
      assert penalty == Penalties.get_penalty!(penalty.id)
    end

    test "delete_penalty/1 deletes the penalty" do
      penalty = penalty_fixture()
      assert {:ok, %Penalty{}} = Penalties.delete_penalty(penalty)
      assert_raise Ecto.NoResultsError, fn -> Penalties.get_penalty!(penalty.id) end
    end

    test "change_penalty/1 returns a penalty changeset" do
      penalty = penalty_fixture()
      assert %Ecto.Changeset{} = Penalties.change_penalty(penalty)
    end
  end
end
