defmodule Heirarchy.Nest.TaGroup do
  use Ecto.Schema
  import Ecto.Changeset


  schema "groups" do
    field :lft, :integer
    field :name, :string
    field :parent_id, :integer
    field :rgt, :integer
    field :taxonomy_id, :integer

    timestamps()
  end

  @doc false
  def changeset(ta_group, attrs) do
    ta_group
    |> cast(attrs, [:name, :parent_id, :rgt, :lft, :taxonomy_id])
    |> validate_required([:name, :parent_id, :rgt, :lft, :taxonomy_id])
  end
end
