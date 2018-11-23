defmodule Heirarchy.Nest.TaGroup do
  use Ecto.Schema
  import Ecto.Changeset
  use AsNestedSet
  alias Heirarchy.Repo
  alias __MODULE__

  schema "groups" do
    field :lft, :integer
    field :name, :string
    field :parent_id, :integer
    field :rgt, :integer

    timestamps()
  end

  @doc false
  def changeset(ta_group, attrs) do
    ta_group
    |> cast(attrs, [:name, :parent_id, :rgt, :lft])
    |> validate_required([:name])
  end
end
