defmodule LiveviewTrelloWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `LiveviewTrelloWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, LiveviewTrelloWeb.UserLive.FormComponent,
        id: @user.id || :new,
        action: @live_action,
        user: @user,
        return_to: Routes.user_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, LiveviewTrelloWeb.ModalComponent, modal_opts)
  end

  def user_name(user) do
    String.first(user.last_name)<>String.first(user.first_name)
  end
end
