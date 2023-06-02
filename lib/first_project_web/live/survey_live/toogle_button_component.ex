defmodule FirstProjectWeb.SurveyLive.ToogleButtonComponent do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <button id="toggleButton" phx-click="demographics_hide">+</button>
    <div id="content" style={display_style(assigns.demographics_hide)}>
        <%= render_slot(@inner_block) %>
    </div>
    """
  end


  def display_style(false), do: "display: none;"
  def display_style(true), do: ""
end
