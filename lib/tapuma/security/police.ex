defmodule Tapuma.Security.Police do
  use Ecto.Schema
  import Ecto.Changeset


  schema "police" do
    field :firstname, :string
    field :lastname, :string
    field :license, :integer
  end

  @doc false
  def changeset(police, attrs) do
    police
    |> cast(attrs, [:id, :license, :firstname, :lastname])
    |> validate_required([:id, :license, :firstname, :lastname])
  end
end
