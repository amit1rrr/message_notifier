defmodule HelloWeb.RoomChannel do
  use Phoenix.Channel

  def join("messages:slack", _message, socket) do
    {:ok, socket}
  end

  def join("messages:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    Slackex.Chat.post_message("#general", body)
  end
end