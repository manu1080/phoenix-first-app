defmodule FirstProjectWeb.PageController do
  use FirstProjectWeb, :controller

  def index(conn, _params) do
    if conn.assigns[:current_user] do
      redirect(conn, to: "/guess")
    else
      render(conn, "index.html")
    end
  end

end
