defmodule LiveViewStudioWeb.LightLive do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    IO.puts("MOUNT #{inspect(self())}")
    socket = assign(socket, :brightness, 10)
    {:ok, socket}
  end

  def render(assigns) do
    IO.puts("RENDER #{inspect(self())}")
    ~L"""
      <h1>Front Porch Light</h1>
      <div id="light">
        <div class="meter">
          <span style="width: <%= @brightness %>">
            <%= @brightness %>%
          </span>
        </div>
        <button phx-click = "off">
          <img src = "images/light-off.svg">
        </button>
        <button phx-click = "on">
          <img src = "images/light-on.svg">
        </button>
      </div>
    """
  end

  def handle_event("on", _, socket) do
    IO.puts("ON #{inspect(self())}")
    socket = assign(socket, :brightness, 100)
    {:noreply, socket}
  end
end
