defmodule Tapuma.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers) do
      add :id_driver, :integer
      add :driver_license, :integer
      add :people_id_id, references(:people, on_delete: :nothing)

      timestamps()
    end

    create index(:drivers, [:people_id])
  end
end
