defmodule Tapuma.Travels.Travel do
  use Ecto.Schema

  @primary_key {:id_trip, :integer, []}
  schema "travels" do
    field :distance, :integer
    field :has_more_destinations, :boolean, default: false
    field :has_more_origins, :boolean, default: false
    field :passenger, :integer
    field :price, :integer
    field :trip_time, :integer
    field :id_passenger, :integer
  end
end
