defmodule FirstProjectWeb.SurveyLive do
  alias __MODULE__.Component
  alias __MODULE__.TitleComponent
  alias __MODULE__.ListItemComponent
  alias FirstProjectWeb.RatingLive
  alias FirstProjectWeb.DemographicLive
  alias FirstProject.Survey
  alias FirstProject.Catalog
  use FirstProjectWeb, :live_view

  def mount(_params, _session, socket) do
    IO.inspect(socket.assigns.current_user)

    {:ok,
     socket
     |> assign_demographic()
     |> assign_products()}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    assign(
      socket,
      :demographic,
      Survey.get_demographic_by_user(current_user)
    )
  end

  def assign_products(%{assigns: %{current_user: current_user}} = socket) do
    assign(socket, :products, list_products(current_user))
  end

  defp list_products(user) do
    Catalog.list_products_with_user_rating(user)
  end

  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply, handle_demographic_created(socket, demographic)}
  end

  def handle_demographic_created(socket, demographic) do
    socket
    |> put_flash(:info, "Demographic created successfully")
    |> assign(:demographic, demographic)
  end
end
