defmodule Tapuma.Repo.Migrations.CreateCar do
  use Ecto.Migration

  def change do
    create table(:car) do
      add :model, :string
      add :brand, :string
      add :year, :integer
      add :cylinder, :integer
      add :door, :integer
      add :hassparetire, :boolean, default: false, null: false
      add :driving, :string
      add :gas, :string
      add :passenger, :integer
      add :capacitytank, :integer
      add :economicnumber, :integer, primary_key: true

      timestamps()
    end

  end
end
