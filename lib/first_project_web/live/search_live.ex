defmodule FirstProjectWeb.SearchLive do
  use FirstProjectWeb, :live_view
  alias FirstProject.Search

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign_search()
     |> assign_changeset()}
  end

  def assign_search(socket) do
    socket
    |> assign(:search, %Search{})
  end

  def assign_changeset(%{assigns: %{search: search}} = socket) do
    socket
    |> assign(:changeset, Search.change_search(search))
  end

  def handle_event(
        "validate",
        %{"search" => search_params},
        %{assigns: %{search: search}} = socket
      ) do
    changeset =
      search
      |> Search.change_search(search_params)
      |> Map.put(:action, :validate)

    {:noreply,
     socket
     |> assign(:changeset, changeset)}
  end
end
