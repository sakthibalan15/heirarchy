defmodule Heirarchy.Repo.Migrations.CreateTaxons do
  use Ecto.Migration

  def change do
    create table(:taxons) do
      add :name, :string
      add :parent_id, :integer
      add :rgt, :integer
      add :lft, :integer
      add :taxonomy_id, :integer

      timestamps()
    end

  end
end
