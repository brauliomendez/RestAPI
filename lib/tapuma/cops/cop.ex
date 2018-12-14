defmodule Tapuma.Cops.Cop do
  use Ecto.Schema

  @primary_key {:license, :integer, []}
  schema "cops" do
    field :first_name, :string
    field :last_name, :string
  end

end
