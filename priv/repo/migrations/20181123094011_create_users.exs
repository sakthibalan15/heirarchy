defmodule Heirarchy.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :dp_image, :string

      timestamps()
    end

  end
end
