defmodule Tapuma.UsersTest do
  use Tapuma.DataCase

  alias Tapuma.Users

  describe "people" do
    alias Tapuma.Users.People

    @valid_attrs %{city: "some city", date_admission: ~D[2010-04-17], email: "some email", first_name: "some first_name", people_id: 42, last_name: "some last_name", number_street: 42, phone: "some phone", picture: "some picture", street: "some street", zip_code: 42}
    @update_attrs %{city: "some updated city", date_admission: ~D[2011-05-18], email: "some updated email", first_name: "some updated first_name", people_id: 43, last_name: "some updated last_name", number_street: 43, phone: "some updated phone", picture: "some updated picture", street: "some updated street", zip_code: 43}
    @invalid_attrs %{city: nil, date_admission: nil, email: nil, first_name: nil, people_id: nil, last_name: nil, number_street: nil, phone: nil, picture: nil, street: nil, zip_code: nil}

    def people_fixture(attrs \\ %{}) do
      {:ok, people} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Users.create_people()

      people
    end

    test "list_people/0 returns all people" do
      people = people_fixture()
      assert Users.list_people() == [people]
    end

    test "get_people!/1 returns the people with given id" do
      people = people_fixture()
      assert Users.get_people!(people.id) == people
    end

    test "create_people/1 with valid data creates a people" do
      assert {:ok, %People{} = people} = Users.create_people(@valid_attrs)
      assert people.city == "some city"
      assert people.date_admission == ~D[2010-04-17]
      assert people.email == "some email"
      assert people.first_name == "some first_name"
      assert people.people_id == 42
      assert people.last_name == "some last_name"
      assert people.number_street == 42
      assert people.phone == "some phone"
      assert people.picture == "some picture"
      assert people.street == "some street"
      assert people.zip_code == 42
    end

    test "create_people/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_people(@invalid_attrs)
    end

    test "update_people/2 with valid data updates the people" do
      people = people_fixture()
      assert {:ok, people} = Users.update_people(people, @update_attrs)
      assert %People{} = people
      assert people.city == "some updated city"
      assert people.date_admission == ~D[2011-05-18]
      assert people.email == "some updated email"
      assert people.first_name == "some updated first_name"
      assert people.people_id == 43
      assert people.last_name == "some updated last_name"
      assert people.number_street == 43
      assert people.phone == "some updated phone"
      assert people.picture == "some updated picture"
      assert people.street == "some updated street"
      assert people.zip_code == 43
    end

    test "update_people/2 with invalid data returns error changeset" do
      people = people_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_people(people, @invalid_attrs)
      assert people == Users.get_people!(people.id)
    end

    test "delete_people/1 deletes the people" do
      people = people_fixture()
      assert {:ok, %People{}} = Users.delete_people(people)
      assert_raise Ecto.NoResultsError, fn -> Users.get_people!(people.id) end
    end

    test "change_people/1 returns a people changeset" do
      people = people_fixture()
      assert %Ecto.Changeset{} = Users.change_people(people)
    end
  end
end
