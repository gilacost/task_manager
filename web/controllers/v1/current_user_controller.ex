defmodule HomeWorkManager.CurrentUserController do
  use HomeWorkManager.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: HomeWorkManager.SessionController

  def show(conn, _) do
    user = Guardian.Plug.current_resource(conn)

    conn
    |> put_status(:ok)
    |> render("show.json", user: user)
  end
end
