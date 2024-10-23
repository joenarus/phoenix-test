defmodule LiveViewStudioWeb.LightForm do
  use LiveViewStudioWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :brightness, 10)}
    {:ok, assign(socket, :people, LiveViewStudio.Person |> LiveViewStudio.Repo.all)}
  end

  def handle_event("submit", _, socket) do
    person = %LiveViewStudio.Person{}
    changeset = LiveViewStudio.Person.changeset(person, %{first_name: "Ryan", last_name: "Bigg"})
    LiveViewStudio.Repo.insert(changeset)
    socket = assign(socket, :people, LiveViewStudio.Person |> LiveViewStudio.Repo.all)
    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
      <div class='flex flex-col gap-8'>
        <div class='flex gap-4'>
          <div>
            <sp-field-label size="l" for="first-name-0-l">First Name</sp-field-label>
              <sp-textfield
                size="l"
                id="first-name-0-l"
                placeholder="Enter your first name"
            ></sp-textfield>
          </div>
          <div>
            <sp-field-label size="l" for="last-name-0-l">Last Name</sp-field-label>
            <sp-textfield
              size="l"
              id="last-name-0-l"
              placeholder="Enter your last name"
            ></sp-textfield>
          </div>
          <div>
            <sp-field-label size="l" for="age-0-l">Age</sp-field-label>
            <sp-number-field
              id="age-0-l"
              label="Age"
              value="29"
              size="l"
              style="--spectrum-stepper-width: 200px"
            ></sp-number-field>
          </div>
        </div>
        <sp-button phx-click="submit">Add Person</sp-button>
        <div>
          <sp-table>
            <sp-table-head>
              <sp-table-head-cell>First Name</sp-table-head-cell>
              <sp-table-head-cell>Last Name</sp-table-head-cell>
              <sp-table-head-cell>Age</sp-table-head-cell>
            </sp-table-head>
            <sp-table-body>
              <%= for person <- @people do %>
                <sp-table-row>
                  <sp-table-cell>
                    <%= person.first_name %>
                  </sp-table-cell>
                  <sp-table-cell>
                    <%= person.last_name %>
                  </sp-table-cell>
                  <sp-table-cell>
                    <%= person.age %>
                  </sp-table-cell>
                </sp-table-row>
              <% end %>
            </sp-table-body>
          </sp-table>
        </div>
      </div>
    """
  end
end
