defmodule Tapuma.Transport.Car do
  use Ecto.Schema
  import Ecto.Changeset


  schema "car" do
    field :brand, :string
    field :capacitytank, :integer
    field :cylinder, :integer
    field :door, :integer
    field :driving, :string
    field :economicnumber, :integer
    field :gas, :string
    field :hassparetire, :boolean, default: false
    field :model, :string
    field :passenger, :integer
    field :year, :integer

  end

  @doc false
  def changeset(car, attrs) do
    car
    |> cast(attrs, [:model, :brand, :year, :cylinder, :door, :hassparetire, :driving, :gas, :passenger, :capacitytank, :economicnumber, :primary_key])
    |> validate_required([:model, :brand, :year, :cylinder, :door, :hassparetire, :driving, :gas, :passenger, :capacitytank, :economicnumber, :primary_key])
  end
end
