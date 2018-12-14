defmodule Tapuma.Owners.Owner do
  use Ecto.Schema

  @primary_key {:id_owner, :integer, []}
  schema "owners" do
    field :rfc, :string
    has_one :people, Tapuma.Users.People, foreign_key: :people_id
  end
end
