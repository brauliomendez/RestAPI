defmodule Tapuma.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :id_owner, :integer
      add :RFC, :string

      timestamps()
    end

  end
end
