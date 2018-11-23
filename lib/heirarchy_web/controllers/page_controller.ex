defmodule HeirarchyWeb.PageController do
  use HeirarchyWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
