defmodule Tapuma.Drivers.Driver do
  use Ecto.Schema

  @primary_key {:id_driver, :integer, []}
  schema "drivers" do
    field :driver_license, :integer
    has_one :people, Tapuma.Users.People, foreign_key: :people_id
    has_many :cars, Tapuma.Cars.Car, foreign_key: :id_driver
  end
end
