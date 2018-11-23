defmodule HeirarchyWeb.TaxonControllerTest do
  use HeirarchyWeb.ConnCase

  alias Heirarchy.Nest

  @create_attrs %{lft: 42, name: "some name", parent_id: 42, rgt: 42, taxonomy_id: 42}
  @update_attrs %{lft: 43, name: "some updated name", parent_id: 43, rgt: 43, taxonomy_id: 43}
  @invalid_attrs %{lft: nil, name: nil, parent_id: nil, rgt: nil, taxonomy_id: nil}

  def fixture(:taxon) do
    {:ok, taxon} = Nest.create_taxon(@create_attrs)
    taxon
  end

  describe "index" do
    test "lists all taxons", %{conn: conn} do
      conn = get conn, taxon_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Taxons"
    end
  end

  describe "new taxon" do
    test "renders form", %{conn: conn} do
      conn = get conn, taxon_path(conn, :new)
      assert html_response(conn, 200) =~ "New Taxon"
    end
  end

  describe "create taxon" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, taxon_path(conn, :create), taxon: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == taxon_path(conn, :show, id)

      conn = get conn, taxon_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Taxon"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, taxon_path(conn, :create), taxon: @invalid_attrs
      assert html_response(conn, 200) =~ "New Taxon"
    end
  end

  describe "edit taxon" do
    setup [:create_taxon]

    test "renders form for editing chosen taxon", %{conn: conn, taxon: taxon} do
      conn = get conn, taxon_path(conn, :edit, taxon)
      assert html_response(conn, 200) =~ "Edit Taxon"
    end
  end

  describe "update taxon" do
    setup [:create_taxon]

    test "redirects when data is valid", %{conn: conn, taxon: taxon} do
      conn = put conn, taxon_path(conn, :update, taxon), taxon: @update_attrs
      assert redirected_to(conn) == taxon_path(conn, :show, taxon)

      conn = get conn, taxon_path(conn, :show, taxon)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, taxon: taxon} do
      conn = put conn, taxon_path(conn, :update, taxon), taxon: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Taxon"
    end
  end

  describe "delete taxon" do
    setup [:create_taxon]

    test "deletes chosen taxon", %{conn: conn, taxon: taxon} do
      conn = delete conn, taxon_path(conn, :delete, taxon)
      assert redirected_to(conn) == taxon_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, taxon_path(conn, :show, taxon)
      end
    end
  end

  defp create_taxon(_) do
    taxon = fixture(:taxon)
    {:ok, taxon: taxon}
  end
end
