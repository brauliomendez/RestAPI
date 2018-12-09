defmodule Tapuma.Repo.Migrations.CreatePolice do
  use Ecto.Migration

  def change do
    create table(:police) do
      add :id, :integer
      add :license, :integer
      add :firstname, :string
      add :lastname, :string

      timestamps()
    end

  end
end
