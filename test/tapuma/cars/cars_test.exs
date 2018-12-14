defmodule Tapuma.CarsTest do
  use Tapuma.DataCase

  alias Tapuma.Cars

  describe "cars" do
    alias Tapuma.Cars.Car

    @valid_attrs %{brand: "some brand", capacity_tank: 42, cylinder: 42, door: 42, driving: "some driving", economic_number: 42, gas: "some gas", has_spare_tire: true, id_driver: 42, id_owner: 42, model: "some model", passenger: 42, year: 42}
    @update_attrs %{brand: "some updated brand", capacity_tank: 43, cylinder: 43, door: 43, driving: "some updated driving", economic_number: 43, gas: "some updated gas", has_spare_tire: false, id_driver: 43, id_owner: 43, model: "some updated model", passenger: 43, year: 43}
    @invalid_attrs %{brand: nil, capacity_tank: nil, cylinder: nil, door: nil, driving: nil, economic_number: nil, gas: nil, has_spare_tire: nil, id_driver: nil, id_owner: nil, model: nil, passenger: nil, year: nil}

    def car_fixture(attrs \\ %{}) do
      {:ok, car} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Cars.create_car()

      car
    end

    test "list_cars/0 returns all cars" do
      car = car_fixture()
      assert Cars.list_cars() == [car]
    end

    test "get_car!/1 returns the car with given id" do
      car = car_fixture()
      assert Cars.get_car!(car.id) == car
    end

    test "create_car/1 with valid data creates a car" do
      assert {:ok, %Car{} = car} = Cars.create_car(@valid_attrs)
      assert car.brand == "some brand"
      assert car.capacity_tank == 42
      assert car.cylinder == 42
      assert car.door == 42
      assert car.driving == "some driving"
      assert car.economic_number == 42
      assert car.gas == "some gas"
      assert car.has_spare_tire == true
      assert car.id_driver == 42
      assert car.id_owner == 42
      assert car.model == "some model"
      assert car.passenger == 42
      assert car.year == 42
    end

    test "create_car/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cars.create_car(@invalid_attrs)
    end

    test "update_car/2 with valid data updates the car" do
      car = car_fixture()
      assert {:ok, car} = Cars.update_car(car, @update_attrs)
      assert %Car{} = car
      assert car.brand == "some updated brand"
      assert car.capacity_tank == 43
      assert car.cylinder == 43
      assert car.door == 43
      assert car.driving == "some updated driving"
      assert car.economic_number == 43
      assert car.gas == "some updated gas"
      assert car.has_spare_tire == false
      assert car.id_driver == 43
      assert car.id_owner == 43
      assert car.model == "some updated model"
      assert car.passenger == 43
      assert car.year == 43
    end

    test "update_car/2 with invalid data returns error changeset" do
      car = car_fixture()
      assert {:error, %Ecto.Changeset{}} = Cars.update_car(car, @invalid_attrs)
      assert car == Cars.get_car!(car.id)
    end

    test "delete_car/1 deletes the car" do
      car = car_fixture()
      assert {:ok, %Car{}} = Cars.delete_car(car)
      assert_raise Ecto.NoResultsError, fn -> Cars.get_car!(car.id) end
    end

    test "change_car/1 returns a car changeset" do
      car = car_fixture()
      assert %Ecto.Changeset{} = Cars.change_car(car)
    end
  end
end
