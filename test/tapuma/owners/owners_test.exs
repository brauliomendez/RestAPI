defmodule Tapuma.OwnersTest do
  use Tapuma.DataCase

  alias Tapuma.Owners

  describe "owners" do
    alias Tapuma.Owners.Owner

    @valid_attrs %{RFC: "some RFC", id_owner: 42}
    @update_attrs %{RFC: "some updated RFC", id_owner: 43}
    @invalid_attrs %{RFC: nil, id_owner: nil}

    def owner_fixture(attrs \\ %{}) do
      {:ok, owner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Owners.create_owner()

      owner
    end

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Owners.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Owners.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      assert {:ok, %Owner{} = owner} = Owners.create_owner(@valid_attrs)
      assert owner.RFC == "some RFC"
      assert owner.id_owner == 42
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Owners.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      assert {:ok, owner} = Owners.update_owner(owner, @update_attrs)
      assert %Owner{} = owner
      assert owner.RFC == "some updated RFC"
      assert owner.id_owner == 43
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Owners.update_owner(owner, @invalid_attrs)
      assert owner == Owners.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Owners.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Owners.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Owners.change_owner(owner)
    end
  end
end
