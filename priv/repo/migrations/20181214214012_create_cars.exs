defmodule Tapuma.Repo.Migrations.CreateCars do
  use Ecto.Migration

  def change do
    create table(:cars) do
      add :economic_number, :integer
      add :model, :string
      add :brand, :string
      add :year, :integer
      add :cylinder, :integer
      add :door, :integer
      add :has_spare_tire, :boolean, default: false, null: false
      add :driving, :string
      add :gas, :string
      add :passenger, :integer
      add :capacity_tank, :integer
      add :id_owner, :integer
      add :id_driver, :integer

      timestamps()
    end

  end
end
