defmodule Tapuma.Cars.Car do
  use Ecto.Schema

  @primary_key {:economic_number, :integer, []}
  schema "cars" do
    field :brand, :string
    field :capacity_tank, :integer
    field :cylinder, :integer
    field :door, :integer
    field :driving, :string
    field :gas, :string
    field :has_spare_tire, :boolean, default: false
    field :id_driver, :integer
    field :id_owner, :integer
    field :model, :string
    field :passenger, :integer
    field :year, :integer
  end

end
