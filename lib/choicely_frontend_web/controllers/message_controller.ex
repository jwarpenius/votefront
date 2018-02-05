defmodule ChoicelyFrontendWeb.MessageController do
  use ChoicelyFrontendWeb, :controller

  def post(conn, params) do
    render conn, "index.json", params: params
  end
end
