defmodule FirstProjectWeb.RedirectController2 do
  use FirstProjectWeb, :controller

  def redirect_to_guess(conn, _params) do
    conn
      |> redirect(to: "/guess")
  end
end
