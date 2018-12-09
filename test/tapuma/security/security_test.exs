defmodule Tapuma.SecurityTest do
  use Tapuma.DataCase

  alias Tapuma.Security

  describe "police" do
    alias Tapuma.Security.Police

    @valid_attrs %{firstname: "some firstname", id: 42, lastname: "some lastname", license: 42}
    @update_attrs %{firstname: "some updated firstname", id: 43, lastname: "some updated lastname", license: 43}
    @invalid_attrs %{firstname: nil, id: nil, lastname: nil, license: nil}

    def police_fixture(attrs \\ %{}) do
      {:ok, police} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Security.create_police()

      police
    end

    test "list_police/0 returns all police" do
      police = police_fixture()
      assert Security.list_police() == [police]
    end

    test "get_police!/1 returns the police with given id" do
      police = police_fixture()
      assert Security.get_police!(police.id) == police
    end

    test "create_police/1 with valid data creates a police" do
      assert {:ok, %Police{} = police} = Security.create_police(@valid_attrs)
      assert police.firstname == "some firstname"
      assert police.id == 42
      assert police.lastname == "some lastname"
      assert police.license == 42
    end

    test "create_police/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Security.create_police(@invalid_attrs)
    end

    test "update_police/2 with valid data updates the police" do
      police = police_fixture()
      assert {:ok, police} = Security.update_police(police, @update_attrs)
      assert %Police{} = police
      assert police.firstname == "some updated firstname"
      assert police.id == 43
      assert police.lastname == "some updated lastname"
      assert police.license == 43
    end

    test "update_police/2 with invalid data returns error changeset" do
      police = police_fixture()
      assert {:error, %Ecto.Changeset{}} = Security.update_police(police, @invalid_attrs)
      assert police == Security.get_police!(police.id)
    end

    test "delete_police/1 deletes the police" do
      police = police_fixture()
      assert {:ok, %Police{}} = Security.delete_police(police)
      assert_raise Ecto.NoResultsError, fn -> Security.get_police!(police.id) end
    end

    test "change_police/1 returns a police changeset" do
      police = police_fixture()
      assert %Ecto.Changeset{} = Security.change_police(police)
    end
  end
end
