defmodule ChoicelyFrontend.Publisher do
  alias ChoicelyFrontend.RequestSchema, as: Schema
  alias ChoicelyFrontend.GooglePubSub, as: PubSub

  def publish(%{"_json" => list}) when is_list(list),
    do: Enum.map(list, &publish_item/1)

  def publish(params),
    do: publish_item(params)

  defp publish_item(item) do

    project = Application.get_env(:choicely_votefront, ChoicelyVotefront.Endpoint)[:project]
    topic = Application.get_env(:choicely_votefront, ChoicelyVotefront.Endpoint)[:topic]
    
    case Schema.validate(item) do
      :ok ->
        PubSub.publish(project, topic, item)
        :published
      {:error, errors} -> %{"errors" => encode(errors), "item" => item}
    end
  end

  defp encode(errors), do: Enum.map(errors, fn {key, val} -> %{key => val} end)

end