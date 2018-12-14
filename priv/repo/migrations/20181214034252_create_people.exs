defmodule Tapuma.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :people_id, :integer
      add :first_name, :string
      add :last_name, :string
      add :city, :string
      add :street, :string
      add :number_street, :integer
      add :zip_code, :integer
      add :phone, :string
      add :picture, :string
      add :email, :string
      add :date_admission, :date

      timestamps()
    end

  end
end
