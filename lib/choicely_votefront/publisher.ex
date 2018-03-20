defmodule ChoicelyFrontend.Publisher do
  alias ChoicelyFrontend.RequestSchema, as: Schema
  alias ChoicelyFrontend.GooglePubSub, as: PubSub

  def publish(%{"_json" => list}) when is_list(list), do: Enum.map(list, &publish_item/1)
  def publish(params), do: publish_item(params)
  defp publish_item(item) do
    case Schema.validate(item) do
      :ok ->
        PubSub.publish("loventedtest", "votes", item)
        :published
      {:error, errors} -> %{"errors" => encode(errors), "item" => item}
    end
  end

  defp encode(errors), do: Enum.map(errors, fn {key, val} -> %{key => val} end)
end