defmodule HeirarchyWeb.TaGroupController do
  use HeirarchyWeb, :controller

  alias Heirarchy.Nest
  alias Heirarchy.Nest.TaGroup

  def index(conn, _params) do
    groups = Nest.list_groups()
    render(conn, "index.html", groups: groups)
  end

  def new(conn, _params) do
    changeset = Nest.change_ta_group(%TaGroup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"ta_group" => ta_group_params}) do
    case Nest.create_ta_group(ta_group_params) do
      {:ok, ta_group} ->
        conn
        |> put_flash(:info, "Ta group created successfully.")
        |> redirect(to: ta_group_path(conn, :show, ta_group))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    ta_group = Nest.get_ta_group!(id)
    render(conn, "show.html", ta_group: ta_group)
  end

  def edit(conn, %{"id" => id}) do
    ta_group = Nest.get_ta_group!(id)
    changeset = Nest.change_ta_group(ta_group)
    render(conn, "edit.html", ta_group: ta_group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "ta_group" => ta_group_params}) do
    ta_group = Nest.get_ta_group!(id)

    case Nest.update_ta_group(ta_group, ta_group_params) do
      {:ok, ta_group} ->
        conn
        |> put_flash(:info, "Ta group updated successfully.")
        |> redirect(to: ta_group_path(conn, :show, ta_group))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", ta_group: ta_group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    ta_group = Nest.get_ta_group!(id)
    {:ok, _ta_group} = Nest.delete_ta_group(ta_group)

    conn
    |> put_flash(:info, "Ta group deleted successfully.")
    |> redirect(to: ta_group_path(conn, :index))
  end
end
