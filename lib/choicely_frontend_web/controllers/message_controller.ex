defmodule ChoicelyFrontendWeb.MessageController do
  use ChoicelyFrontendWeb, :controller
  alias ChoicelyFrontend.RequestSchema, as: Schema

  def post(conn, _) do
    params = conn.body_params
    data =
      case Schema.validate(params) do
        :ok -> %{"success" => true}
        {:error, errors} -> %{"errors" => encode(errors), "request" => params}
      end
    render conn, "index.json", data: data
  end

  defp encode(errors) do
    errors
    |> Enum.map(fn {key, val} -> %{key => val} end)
  end
end
