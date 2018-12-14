defmodule Tapuma.CopsTest do
  use Tapuma.DataCase

  alias Tapuma.Cops

  describe "cops" do
    alias Tapuma.Cops.Cop

    @valid_attrs %{first_name: "some first_name", last_name: "some last_name", license: 42}
    @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", license: 43}
    @invalid_attrs %{first_name: nil, last_name: nil, license: nil}

    def cop_fixture(attrs \\ %{}) do
      {:ok, cop} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cops.create_cop()

      cop
    end

    test "list_cops/0 returns all cops" do
      cop = cop_fixture()
      assert Cops.list_cops() == [cop]
    end

    test "get_cop!/1 returns the cop with given id" do
      cop = cop_fixture()
      assert Cops.get_cop!(cop.id) == cop
    end

    test "create_cop/1 with valid data creates a cop" do
      assert {:ok, %Cop{} = cop} = Cops.create_cop(@valid_attrs)
      assert cop.first_name == "some first_name"
      assert cop.last_name == "some last_name"
      assert cop.license == 42
    end

    test "create_cop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cops.create_cop(@invalid_attrs)
    end

    test "update_cop/2 with valid data updates the cop" do
      cop = cop_fixture()
      assert {:ok, cop} = Cops.update_cop(cop, @update_attrs)
      assert %Cop{} = cop
      assert cop.first_name == "some updated first_name"
      assert cop.last_name == "some updated last_name"
      assert cop.license == 43
    end

    test "update_cop/2 with invalid data returns error changeset" do
      cop = cop_fixture()
      assert {:error, %Ecto.Changeset{}} = Cops.update_cop(cop, @invalid_attrs)
      assert cop == Cops.get_cop!(cop.id)
    end

    test "delete_cop/1 deletes the cop" do
      cop = cop_fixture()
      assert {:ok, %Cop{}} = Cops.delete_cop(cop)
      assert_raise Ecto.NoResultsError, fn -> Cops.get_cop!(cop.id) end
    end

    test "change_cop/1 returns a cop changeset" do
      cop = cop_fixture()
      assert %Ecto.Changeset{} = Cops.change_cop(cop)
    end
  end
end
