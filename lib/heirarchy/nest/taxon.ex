defmodule Heirarchy.Nest.Taxon do
  use Ecto.Schema
  import Ecto.Changeset
  use AsNestedSet
  alias Heirarchy.Repo
  alias __MODULE__

  schema "taxons" do
    field :lft, :integer, default: 0
    field :name, :string
    field :parent_id, :integer
    field :rgt, :integer, default: 0

    timestamps()
  end

  @required_fields ~w(name taxonomy_id lft rgt)
  @optional_fields ~w(parent_id)

  @doc false
  def changeset(taxon, attrs) do
    taxon
    |> cast(attrs, @required_fields ++ @optional_fields)
  end
end
