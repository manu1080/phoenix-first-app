defmodule FirstProjectWeb.SurveyLive.TitleComponent do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <h1>
    <%= @message %>
    </h1>
    """
  end
end
