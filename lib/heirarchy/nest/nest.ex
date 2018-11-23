defmodule Heirarchy.Nest do
  @moduledoc """
  The Nest context.
  """

  import Ecto.Query, warn: false
  alias Heirarchy.Repo

  alias Heirarchy.Nest.Taxon

  @doc """
  Returns the list of taxons.

  ## Examples

      iex> list_taxons()
      [%Taxon{}, ...]

  """
  def list_taxons do
    Repo.all(Taxon)
  end

  @doc """
  Gets a single taxon.

  Raises `Ecto.NoResultsError` if the Taxon does not exist.

  ## Examples

      iex> get_taxon!(123)
      %Taxon{}

      iex> get_taxon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_taxon!(id), do: Repo.get!(Taxon, id)

  @doc """
  Creates a taxon.

  ## Examples

      iex> create_taxon(%{field: value})
      {:ok, %Taxon{}}

      iex> create_taxon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_taxon(attrs \\ %{}) do
    %Taxon{}
    |> Taxon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a taxon.

  ## Examples

      iex> update_taxon(taxon, %{field: new_value})
      {:ok, %Taxon{}}

      iex> update_taxon(taxon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_taxon(%Taxon{} = taxon, attrs) do
    taxon
    |> Taxon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Taxon.

  ## Examples

      iex> delete_taxon(taxon)
      {:ok, %Taxon{}}

      iex> delete_taxon(taxon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_taxon(%Taxon{} = taxon) do
    Repo.delete(taxon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking taxon changes.

  ## Examples

      iex> change_taxon(taxon)
      %Ecto.Changeset{source: %Taxon{}}

  """
  def change_taxon(%Taxon{} = taxon) do
    Taxon.changeset(taxon, %{})
  end

  alias Heirarchy.Nest.TaGroup

  @doc """
  Returns the list of groups.

  ## Examples

      iex> list_groups()
      [%TaGroup{}, ...]

  """
  def list_groups do
    Repo.all(TaGroup)
  end

  @doc """
  Gets a single ta_group.

  Raises `Ecto.NoResultsError` if the Ta group does not exist.

  ## Examples

      iex> get_ta_group!(123)
      %TaGroup{}

      iex> get_ta_group!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ta_group!(id), do: Repo.get!(TaGroup, id)

  @doc """
  Creates a ta_group.

  ## Examples

      iex> create_ta_group(%{field: value})
      {:ok, %TaGroup{}}

      iex> create_ta_group(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ta_group(attrs \\ %{}) do
    %TaGroup{}
    |> TaGroup.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ta_group.

  ## Examples

      iex> update_ta_group(ta_group, %{field: new_value})
      {:ok, %TaGroup{}}

      iex> update_ta_group(ta_group, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ta_group(%TaGroup{} = ta_group, attrs) do
    ta_group
    |> TaGroup.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TaGroup.

  ## Examples

      iex> delete_ta_group(ta_group)
      {:ok, %TaGroup{}}

      iex> delete_ta_group(ta_group)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ta_group(%TaGroup{} = ta_group) do
    Repo.delete(ta_group)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ta_group changes.

  ## Examples

      iex> change_ta_group(ta_group)
      %Ecto.Changeset{source: %TaGroup{}}

  """
  def change_ta_group(%TaGroup{} = ta_group) do
    TaGroup.changeset(ta_group, %{})
  end
end
