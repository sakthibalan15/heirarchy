defmodule HeirarchyWeb.TaxonController do
  use HeirarchyWeb, :controller

  alias Heirarchy.Nest
  alias Heirarchy.Nest.Taxon

  def index(conn, _params) do
    taxons = Nest.list_taxons()
    render(conn, "index.html", taxons: taxons)
  end

  def new(conn, _params) do
    changeset = Nest.change_taxon(%Taxon{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"taxon" => taxon_params}) do
    case Nest.create_taxon(taxon_params) do
      {:ok, taxon} ->
        conn
        |> put_flash(:info, "Taxon created successfully.")
        |> redirect(to: taxon_path(conn, :show, taxon))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    taxon = Nest.get_taxon!(id)
    render(conn, "show.html", taxon: taxon)
  end

  def edit(conn, %{"id" => id}) do
    taxon = Nest.get_taxon!(id)
    changeset = Nest.change_taxon(taxon)
    render(conn, "edit.html", taxon: taxon, changeset: changeset)
  end

  def update(conn, %{"id" => id, "taxon" => taxon_params}) do
    taxon = Nest.get_taxon!(id)

    case Nest.update_taxon(taxon, taxon_params) do
      {:ok, taxon} ->
        conn
        |> put_flash(:info, "Taxon updated successfully.")
        |> redirect(to: taxon_path(conn, :show, taxon))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", taxon: taxon, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    taxon = Nest.get_taxon!(id)
    {:ok, _taxon} = Nest.delete_taxon(taxon)

    conn
    |> put_flash(:info, "Taxon deleted successfully.")
    |> redirect(to: taxon_path(conn, :index))
  end
end
