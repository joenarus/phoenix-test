defmodule LiveViewStudioWeb.LightForm do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
  end

  def render(assigns) do
    ~H"""
      <sp-field-label size="l" for="name-0-l">Name</sp-field-label>
        <sp-textfield
            size="l"
            id="name-0-l"
            placeholder="Enter your name"
      ></sp-textfield>
    """
  end
end