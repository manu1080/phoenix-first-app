defmodule FirstProjectWeb.Admin.DashboardLive do
  use FirstProjectWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> assign(:survey_results_component_id, "survey-results")}
  end

  def render(assigns) do
    ~H"""
    <section class="row">
    <h1>Admin Dashboard</h1>
    </section>
    <.live_component
    module={FirstProjectWeb.Admin.SurveyResultsLive}
    id={@survey_results_component_id} />
    """
  end
end
