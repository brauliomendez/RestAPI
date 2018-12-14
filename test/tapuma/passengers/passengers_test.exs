defmodule Tapuma.PassengersTest do
  use Tapuma.DataCase

  alias Tapuma.Passengers

  describe "passengers" do
    alias Tapuma.Passengers.Passenger

    @valid_attrs %{entry_hour: "some entry_hour", exit_hour: "some exit_hour", id_passenger: 42, phone_home: "some phone_home", school: "some school"}
    @update_attrs %{entry_hour: "some updated entry_hour", exit_hour: "some updated exit_hour", id_passenger: 43, phone_home: "some updated phone_home", school: "some updated school"}
    @invalid_attrs %{entry_hour: nil, exit_hour: nil, id_passenger: nil, phone_home: nil, school: nil}

    def passenger_fixture(attrs \\ %{}) do
      {:ok, passenger} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Passengers.create_passenger()

      passenger
    end

    test "list_passengers/0 returns all passengers" do
      passenger = passenger_fixture()
      assert Passengers.list_passengers() == [passenger]
    end

    test "get_passenger!/1 returns the passenger with given id" do
      passenger = passenger_fixture()
      assert Passengers.get_passenger!(passenger.id) == passenger
    end

    test "create_passenger/1 with valid data creates a passenger" do
      assert {:ok, %Passenger{} = passenger} = Passengers.create_passenger(@valid_attrs)
      assert passenger.entry_hour == "some entry_hour"
      assert passenger.exit_hour == "some exit_hour"
      assert passenger.id_passenger == 42
      assert passenger.phone_home == "some phone_home"
      assert passenger.school == "some school"
    end

    test "create_passenger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Passengers.create_passenger(@invalid_attrs)
    end

    test "update_passenger/2 with valid data updates the passenger" do
      passenger = passenger_fixture()
      assert {:ok, passenger} = Passengers.update_passenger(passenger, @update_attrs)
      assert %Passenger{} = passenger
      assert passenger.entry_hour == "some updated entry_hour"
      assert passenger.exit_hour == "some updated exit_hour"
      assert passenger.id_passenger == 43
      assert passenger.phone_home == "some updated phone_home"
      assert passenger.school == "some updated school"
    end

    test "update_passenger/2 with invalid data returns error changeset" do
      passenger = passenger_fixture()
      assert {:error, %Ecto.Changeset{}} = Passengers.update_passenger(passenger, @invalid_attrs)
      assert passenger == Passengers.get_passenger!(passenger.id)
    end

    test "delete_passenger/1 deletes the passenger" do
      passenger = passenger_fixture()
      assert {:ok, %Passenger{}} = Passengers.delete_passenger(passenger)
      assert_raise Ecto.NoResultsError, fn -> Passengers.get_passenger!(passenger.id) end
    end

    test "change_passenger/1 returns a passenger changeset" do
      passenger = passenger_fixture()
      assert %Ecto.Changeset{} = Passengers.change_passenger(passenger)
    end
  end
end
