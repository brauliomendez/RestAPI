defmodule Tapuma.Owners.Owner do
  use Ecto.Schema

  @primary_key {:id_owner, :integer, []}
  schema "owners" do
    field :rfc, :string
    has_one :people, Tapuma.Users.People, foreign_key: :people_id
    has_many :cars, Tapuma.Cars.Car, foreign_key: :id_driver
  end
end
