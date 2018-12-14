defmodule Tapuma.Repo.Migrations.CreatePassengers do
  use Ecto.Migration

  def change do
    create table(:passengers) do
      add :id_passenger, :integer
      add :phone_home, :string
      add :school, :string
      add :entry_hour, :string
      add :exit_hour, :string

      timestamps()
    end

  end
end
