defmodule Heirarchy.Nest.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :dp_image, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :dp_image])
    |> validate_required([:name, :dp_image])
  end
end
