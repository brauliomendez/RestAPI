defmodule Tapuma.TransportTest do
  use Tapuma.DataCase

  alias Tapuma.Transport

  describe "car" do
    alias Tapuma.Transport.Car

    @valid_attrs %{brand: "some brand", capacitytank: 42, cylinder: 42, door: 42, driving: "some driving", economicnumber: 42, gas: "some gas", hassparetire: true, model: "some model", passenger: 42, primary_key: "some primary_key", year: 42}
    @update_attrs %{brand: "some updated brand", capacitytank: 43, cylinder: 43, door: 43, driving: "some updated driving", economicnumber: 43, gas: "some updated gas", hassparetire: false, model: "some updated model", passenger: 43, primary_key: "some updated primary_key", year: 43}
    @invalid_attrs %{brand: nil, capacitytank: nil, cylinder: nil, door: nil, driving: nil, economicnumber: nil, gas: nil, hassparetire: nil, model: nil, passenger: nil, primary_key: nil, year: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Transport.create_car()

      car
    end

    test "list_car/0 returns all car" do
      car = car_fixture()
      assert Transport.list_car() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Transport.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Transport.create_car(@valid_attrs)
      assert car.brand == "some brand"
      assert car.capacitytank == 42
      assert car.cylinder == 42
      assert car.door == 42
      assert car.driving == "some driving"
      assert car.economicnumber == 42
      assert car.gas == "some gas"
      assert car.hassparetire == true
      assert car.model == "some model"
      assert car.passenger == 42
      assert car.primary_key == "some primary_key"
      assert car.year == 42
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Transport.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, car} = Transport.update_car(car, @update_attrs)
      assert %Car{} = car
      assert car.brand == "some updated brand"
      assert car.capacitytank == 43
      assert car.cylinder == 43
      assert car.door == 43
      assert car.driving == "some updated driving"
      assert car.economicnumber == 43
      assert car.gas == "some updated gas"
      assert car.hassparetire == false
      assert car.model == "some updated model"
      assert car.passenger == 43
      assert car.primary_key == "some updated primary_key"
      assert car.year == 43
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Transport.update_car(car, @invalid_attrs)
      assert car == Transport.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Transport.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Transport.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Transport.change_car(car)
    end
  end
end
