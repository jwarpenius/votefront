defmodule ChoicelyVotefront.MessageController do
  use ChoicelyVotefront, :controller
  alias ChoicelyFrontend.Publisher

  def post(conn, _) do
    data = Publisher.publish(conn.body_params)

    conn
    |> put_status(status(data))
    |> render("index.json", data: data)
  end

  defp status(data) do
    case data do
      :published -> :ok
      %{} -> :unprocessable_entity
    end
  end
end
