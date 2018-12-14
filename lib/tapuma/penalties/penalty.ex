defmodule Tapuma.Penalties.Penalty do
  use Ecto.Schema

  @primary_key {:id_penalty, :integer, []}
  schema "penalties" do
    field :city, :string
    field :economic_number, :integer
    field :hour, :string
    field :id_driver, :integer
    field :license, :integer
    field :price, :integer
    field :street, :string
  end

end
