defmodule Tapuma.Users.People do
  use Ecto.Schema

  @primary_key {:people_id, :integer, []}
  schema "people" do
    field :city, :string
    field :date_admission, :date
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :number_street, :integer
    field :phone, :string
    field :picture, :string
    field :street, :string
    field :zip_code, :integer

  end

end
