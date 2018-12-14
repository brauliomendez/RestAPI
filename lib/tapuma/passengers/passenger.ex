defmodule Tapuma.Passengers.Passenger do
  use Ecto.Schema

  @primary_key {:id_passenger, :integer, []}
  schema "passengers" do
    field :entry_hour, :string
    field :exit_hour, :string
    field :phone_home, :string
    field :school, :string
    has_one :people, Tapuma.Users.People, foreign_key: :people_id
  end
end
