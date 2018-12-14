defmodule Tapuma.TravelsTest do
  use Tapuma.DataCase

  alias Tapuma.Travels

  describe "travels" do
    alias Tapuma.Travels.Travel

    @valid_attrs %{distance: 42, has_more_destinations: true, has_more_origins: true, id_trip: 42, passenger: 42, price: 42, trip_time: 42}
    @update_attrs %{distance: 43, has_more_destinations: false, has_more_origins: false, id_trip: 43, passenger: 43, price: 43, trip_time: 43}
    @invalid_attrs %{distance: nil, has_more_destinations: nil, has_more_origins: nil, id_trip: nil, passenger: nil, price: nil, trip_time: nil}

    def travel_fixture(attrs \\ %{}) do
      {:ok, travel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Travels.create_travel()

      travel
    end

    test "list_travels/0 returns all travels" do
      travel = travel_fixture()
      assert Travels.list_travels() == [travel]
    end

    test "get_travel!/1 returns the travel with given id" do
      travel = travel_fixture()
      assert Travels.get_travel!(travel.id) == travel
    end

    test "create_travel/1 with valid data creates a travel" do
      assert {:ok, %Travel{} = travel} = Travels.create_travel(@valid_attrs)
      assert travel.distance == 42
      assert travel.has_more_destinations == true
      assert travel.has_more_origins == true
      assert travel.id_trip == 42
      assert travel.passenger == 42
      assert travel.price == 42
      assert travel.trip_time == 42
    end

    test "create_travel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Travels.create_travel(@invalid_attrs)
    end

    test "update_travel/2 with valid data updates the travel" do
      travel = travel_fixture()
      assert {:ok, travel} = Travels.update_travel(travel, @update_attrs)
      assert %Travel{} = travel
      assert travel.distance == 43
      assert travel.has_more_destinations == false
      assert travel.has_more_origins == false
      assert travel.id_trip == 43
      assert travel.passenger == 43
      assert travel.price == 43
      assert travel.trip_time == 43
    end

    test "update_travel/2 with invalid data returns error changeset" do
      travel = travel_fixture()
      assert {:error, %Ecto.Changeset{}} = Travels.update_travel(travel, @invalid_attrs)
      assert travel == Travels.get_travel!(travel.id)
    end

    test "delete_travel/1 deletes the travel" do
      travel = travel_fixture()
      assert {:ok, %Travel{}} = Travels.delete_travel(travel)
      assert_raise Ecto.NoResultsError, fn -> Travels.get_travel!(travel.id) end
    end

    test "change_travel/1 returns a travel changeset" do
      travel = travel_fixture()
      assert %Ecto.Changeset{} = Travels.change_travel(travel)
    end
  end
end
