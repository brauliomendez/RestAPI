defmodule Tapuma.Repo.Migrations.CreatePenalties do
  use Ecto.Migration

  def change do
    create table(:penalties) do
      add :id_penalty, :integer
      add :city, :string
      add :street, :string
      add :hour, :string
      add :price, :integer
      add :license, :integer
      add :id_driver, :integer
      add :economic_number, :integer

      timestamps()
    end

  end
end
