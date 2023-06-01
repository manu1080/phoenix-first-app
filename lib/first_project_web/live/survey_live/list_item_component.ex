defmodule FirstProjectWeb.SurveyLive.ListItemComponent do
  use Phoenix.Component

  def hero(assigns) do
    ~H"""
    <div>
      <p>Item: <%= @item %></p>
    </div>
    """
  end
end
