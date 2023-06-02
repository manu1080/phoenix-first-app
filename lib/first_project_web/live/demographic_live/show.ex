defmodule FirstProjectWeb.DemographicLive.Show do
  use Phoenix.Component
  use Phoenix.HTML

  def details(assigns) do
    ~H"""
    <div class="survey-component-container">
    <h2>Demographics <%= raw "&#x2713;" %></h2>
      <FirstProjectWeb.SurveyLive.ToogleButtonComponent.hero demographics_hide={assigns.demographics_hide}>
      <ul>
        <li>Gender: <%= @demographic.gender %></li>
        <li>Year of birth: <%= @demographic.year_of_birth %></li>
      </ul>
      </FirstProjectWeb.SurveyLive.ToogleButtonComponent.hero>
    </div>
    """
  end
end
