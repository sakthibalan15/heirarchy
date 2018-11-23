defmodule HeirarchyWeb.TaGroupControllerTest do
  use HeirarchyWeb.ConnCase

  alias Heirarchy.Nest

  @create_attrs %{lft: 42, name: "some name", parent_id: 42, rgt: 42, taxonomy_id: 42}
  @update_attrs %{lft: 43, name: "some updated name", parent_id: 43, rgt: 43, taxonomy_id: 43}
  @invalid_attrs %{lft: nil, name: nil, parent_id: nil, rgt: nil, taxonomy_id: nil}

  def fixture(:ta_group) do
    {:ok, ta_group} = Nest.create_ta_group(@create_attrs)
    ta_group
  end

  describe "index" do
    test "lists all groups", %{conn: conn} do
      conn = get conn, ta_group_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Groups"
    end
  end

  describe "new ta_group" do
    test "renders form", %{conn: conn} do
      conn = get conn, ta_group_path(conn, :new)
      assert html_response(conn, 200) =~ "New Ta group"
    end
  end

  describe "create ta_group" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, ta_group_path(conn, :create), ta_group: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ta_group_path(conn, :show, id)

      conn = get conn, ta_group_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Ta group"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, ta_group_path(conn, :create), ta_group: @invalid_attrs
      assert html_response(conn, 200) =~ "New Ta group"
    end
  end

  describe "edit ta_group" do
    setup [:create_ta_group]

    test "renders form for editing chosen ta_group", %{conn: conn, ta_group: ta_group} do
      conn = get conn, ta_group_path(conn, :edit, ta_group)
      assert html_response(conn, 200) =~ "Edit Ta group"
    end
  end

  describe "update ta_group" do
    setup [:create_ta_group]

    test "redirects when data is valid", %{conn: conn, ta_group: ta_group} do
      conn = put conn, ta_group_path(conn, :update, ta_group), ta_group: @update_attrs
      assert redirected_to(conn) == ta_group_path(conn, :show, ta_group)

      conn = get conn, ta_group_path(conn, :show, ta_group)
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, ta_group: ta_group} do
      conn = put conn, ta_group_path(conn, :update, ta_group), ta_group: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Ta group"
    end
  end

  describe "delete ta_group" do
    setup [:create_ta_group]

    test "deletes chosen ta_group", %{conn: conn, ta_group: ta_group} do
      conn = delete conn, ta_group_path(conn, :delete, ta_group)
      assert redirected_to(conn) == ta_group_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, ta_group_path(conn, :show, ta_group)
      end
    end
  end

  defp create_ta_group(_) do
    ta_group = fixture(:ta_group)
    {:ok, ta_group: ta_group}
  end
end
