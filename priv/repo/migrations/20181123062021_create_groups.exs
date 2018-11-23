defmodule Heirarchy.Repo.Migrations.CreateGroups do
  use Ecto.Migration

  def change do
    create table(:groups) do
      add :name, :string
      add :parent_id, :integer
      add :rgt, :integer
      add :lft, :integer

      timestamps()
    end

  end
end
