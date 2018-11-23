defmodule Heirarchy.NestTest do
  use Heirarchy.DataCase

  alias Heirarchy.Nest

  describe "taxons" do
    alias Heirarchy.Nest.Taxon

    @valid_attrs %{lft: 42, name: "some name", parent_id: 42, rgt: 42, taxonomy_id: 42}
    @update_attrs %{lft: 43, name: "some updated name", parent_id: 43, rgt: 43, taxonomy_id: 43}
    @invalid_attrs %{lft: nil, name: nil, parent_id: nil, rgt: nil, taxonomy_id: nil}

    def taxon_fixture(attrs \\ %{}) do
      {:ok, taxon} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nest.create_taxon()

      taxon
    end

    test "list_taxons/0 returns all taxons" do
      taxon = taxon_fixture()
      assert Nest.list_taxons() == [taxon]
    end

    test "get_taxon!/1 returns the taxon with given id" do
      taxon = taxon_fixture()
      assert Nest.get_taxon!(taxon.id) == taxon
    end

    test "create_taxon/1 with valid data creates a taxon" do
      assert {:ok, %Taxon{} = taxon} = Nest.create_taxon(@valid_attrs)
      assert taxon.lft == 42
      assert taxon.name == "some name"
      assert taxon.parent_id == 42
      assert taxon.rgt == 42
      assert taxon.taxonomy_id == 42
    end

    test "create_taxon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nest.create_taxon(@invalid_attrs)
    end

    test "update_taxon/2 with valid data updates the taxon" do
      taxon = taxon_fixture()
      assert {:ok, taxon} = Nest.update_taxon(taxon, @update_attrs)
      assert %Taxon{} = taxon
      assert taxon.lft == 43
      assert taxon.name == "some updated name"
      assert taxon.parent_id == 43
      assert taxon.rgt == 43
      assert taxon.taxonomy_id == 43
    end

    test "update_taxon/2 with invalid data returns error changeset" do
      taxon = taxon_fixture()
      assert {:error, %Ecto.Changeset{}} = Nest.update_taxon(taxon, @invalid_attrs)
      assert taxon == Nest.get_taxon!(taxon.id)
    end

    test "delete_taxon/1 deletes the taxon" do
      taxon = taxon_fixture()
      assert {:ok, %Taxon{}} = Nest.delete_taxon(taxon)
      assert_raise Ecto.NoResultsError, fn -> Nest.get_taxon!(taxon.id) end
    end

    test "change_taxon/1 returns a taxon changeset" do
      taxon = taxon_fixture()
      assert %Ecto.Changeset{} = Nest.change_taxon(taxon)
    end
  end

  describe "groups" do
    alias Heirarchy.Nest.TaGroup

    @valid_attrs %{lft: 42, name: "some name", parent_id: 42, rgt: 42, taxonomy_id: 42}
    @update_attrs %{lft: 43, name: "some updated name", parent_id: 43, rgt: 43, taxonomy_id: 43}
    @invalid_attrs %{lft: nil, name: nil, parent_id: nil, rgt: nil, taxonomy_id: nil}

    def ta_group_fixture(attrs \\ %{}) do
      {:ok, ta_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Nest.create_ta_group()

      ta_group
    end

    test "list_groups/0 returns all groups" do
      ta_group = ta_group_fixture()
      assert Nest.list_groups() == [ta_group]
    end

    test "get_ta_group!/1 returns the ta_group with given id" do
      ta_group = ta_group_fixture()
      assert Nest.get_ta_group!(ta_group.id) == ta_group
    end

    test "create_ta_group/1 with valid data creates a ta_group" do
      assert {:ok, %TaGroup{} = ta_group} = Nest.create_ta_group(@valid_attrs)
      assert ta_group.lft == 42
      assert ta_group.name == "some name"
      assert ta_group.parent_id == 42
      assert ta_group.rgt == 42
      assert ta_group.taxonomy_id == 42
    end

    test "create_ta_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nest.create_ta_group(@invalid_attrs)
    end

    test "update_ta_group/2 with valid data updates the ta_group" do
      ta_group = ta_group_fixture()
      assert {:ok, ta_group} = Nest.update_ta_group(ta_group, @update_attrs)
      assert %TaGroup{} = ta_group
      assert ta_group.lft == 43
      assert ta_group.name == "some updated name"
      assert ta_group.parent_id == 43
      assert ta_group.rgt == 43
      assert ta_group.taxonomy_id == 43
    end

    test "update_ta_group/2 with invalid data returns error changeset" do
      ta_group = ta_group_fixture()
      assert {:error, %Ecto.Changeset{}} = Nest.update_ta_group(ta_group, @invalid_attrs)
      assert ta_group == Nest.get_ta_group!(ta_group.id)
    end

    test "delete_ta_group/1 deletes the ta_group" do
      ta_group = ta_group_fixture()
      assert {:ok, %TaGroup{}} = Nest.delete_ta_group(ta_group)
      assert_raise Ecto.NoResultsError, fn -> Nest.get_ta_group!(ta_group.id) end
    end

    test "change_ta_group/1 returns a ta_group changeset" do
      ta_group = ta_group_fixture()
      assert %Ecto.Changeset{} = Nest.change_ta_group(ta_group)
    end
  end
end
