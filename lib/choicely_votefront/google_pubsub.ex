# From https://github.com/GoogleCloudPlatform/elixir-samples/tree/master/pubsub
defmodule ChoicelyFrontend.GooglePubSub do

  @moduledoc """
  Publishing votes data to Google PubSub.
  """

  @doc """
  Get a PubSub topic.

  ## Examples

      iex> ChoicelyFrontend.GooglePubSub.get_topic("YOUR_PROJECT_ID", "test-topic")

  """

  @gcloud_scope "https://www.googleapis.com/auth/cloud-platform"

  def get_topic(project_id, topic_name) do
    # Authenticate
    conn = authenticate()

    # Make the API request.
    response = GoogleApi.PubSub.V1.Api.Projects.pubsub_projects_topics_get(
      conn,
      project_id,
      topic_name
    )

    case response do
      {:ok, topic} -> topic
      {:error, _} -> nil
    end
  end


  @doc """
  Publish a message to a PubSub topic.

  ## Examples

      iex> GoogleApi.PubSub.Samples.publish("YOUR_PROJECT_ID", "test-topic", "This is a message")
      "published message 159505488737289"

  """
  def publish(project_id, topic_name, message) do
    # Authenticate
    conn = authenticate()

    message = Map.put(message, "timestamp", DateTime.utc_now |> DateTime.to_unix)

    # Build the PublishRequest struct
    request = %GoogleApi.PubSub.V1.Model.PublishRequest{
      messages: [
        %GoogleApi.PubSub.V1.Model.PubsubMessage{
          attributes: stringify_values(message)
        }
      ]
    }

    # Make the API request.
    {:ok, response} = GoogleApi.PubSub.V1.Api.Projects.pubsub_projects_topics_publish(
      conn,
      project_id,
      topic_name,
      [body: request]
    )

    # Todo: consider removing logging
    "published message #{response.messageIds}"
    |> (&IO.ANSI.format([:green, :bright, &1])).()
    |> IO.puts
  end

  defp stringify_values(%{} = message) do
    message
    |> Map.to_list
    |> Enum.reduce(%{}, fn({key, val}, acc) -> Map.put(acc, key, Jason.encode!(val)) end)
  end

  defp authenticate() do
    {:ok, token} = Goth.Token.for_scope(@gcloud_scope)
    GoogleApi.PubSub.V1.Connection.new(token.token)
  end

end
