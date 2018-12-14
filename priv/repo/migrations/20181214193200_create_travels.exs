defmodule Tapuma.Repo.Migrations.CreateTravels do
  use Ecto.Migration

  def change do
    create table(:travels) do
      add :id_trip, :integer
      add :passenger, :integer
      add :has_more_origins, :boolean, default: false, null: false
      add :has_more_destinations, :boolean, default: false, null: false
      add :trip_time, :integer
      add :distance, :integer
      add :price, :integer

      timestamps()
    end

  end
end
