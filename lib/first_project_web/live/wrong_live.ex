defmodule FirstProjectWeb.WrongLive do
  use Phoenix.LiveView, layout: {FirstProjectWeb.LayoutView, "live.html"}

  def mount( _params, session, socket) do
    {:ok,
     assign(socket,
       score: 0,
       message: "Make a guess:",
       time: time(),
       initial_number: initial_number(),
       session_id: session["live_socket_id"]
     )}
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
    <%= @message %>
    </h2>
    <h2>
    <%= for n <- 1..10 do %>
    <a href="#" phx-click="guess" phx-value-number= {n} ><%= n %></a>
    <% end %>
    <pre>
    <%= @current_user.username %>
    <%= @session_id %>
    </pre>
    </h2>
    """
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def initial_number do
    Enum.random(1..10)
  end

  def win(guess, socket) do
    {socket.assigns.score + 1, "Your guess: #{guess}. You win the game. ", initial_number()}
  end

  def lose(guess, socket) do
    {socket.assigns.score - 1, " Your guess: #{guess}. Wrong. Guess again. ",
     socket.assigns.initial_number}
  end

  def handle_event("guess", %{"number" => guess} = data, socket) do
    {score, message, initial_number} =
      if socket.assigns.initial_number == String.to_integer(guess),
        do: win(guess, socket),
        else: lose(guess, socket)

    time = time()

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score,
        time: time,
        initial_number: initial_number
      )
    }
  end
end
