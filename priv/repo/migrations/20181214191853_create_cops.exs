defmodule Tapuma.Repo.Migrations.CreateCops do
  use Ecto.Migration

  def change do
    create table(:cops) do
      add :license, :integer
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end

  end
end
