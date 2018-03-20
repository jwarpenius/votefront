defmodule ChoicelyVotefront.MessageController do
  use ChoicelyVotefront, :controller
  alias ChoicelyFrontend.Publisher

  def post(conn, _) do
    data = Publisher.publish(conn.body_params)
    render conn, "index.json", data: data
  end
end
