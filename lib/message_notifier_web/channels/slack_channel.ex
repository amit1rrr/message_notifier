defmodule MessageNotifierWeb.SlackChannel do
  use Phoenix.Channel

  def join("messages:slack", _message, socket) do
    {:ok, socket}
  end

  def join("messages:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    IO.puts body
    Slackex.Chat.post_message("#general", body)
  end
end