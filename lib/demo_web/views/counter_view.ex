defmodule DemoWeb.CounterView do
  use Phoenix.LiveView

  def render(assigns) do
    ~E"""
    <div>
      <h1 phx-click="boom">The count is: <%= @val %></h1>
      <button phx-click="boom" class="alert-danger">BOOM</button>
      <button phx-click="dec">-</button>
      <button phx-click="inc">+</button>
    </div>
    <%= if @val < 5 do %>
      <%= live_render(@socket, DemoWeb.ClockView) %>
    <% else %>
      <%= live_render(@socket, DemoWeb.ImageView) %>
    <% end %>
    """
  end

  def init(_session, socket) do
    {:ok, assign(socket, :val, 0)}
  end

  def handle_event("inc", _, _, socket) do
    {:noreply, update(socket, :val, &(&1 + 1))}
  end

  def handle_event("dec", _, _, socket) do
    {:noreply, update(socket, :val, &(&1 - 1))}
  end
end