defmodule ChoicelyFrontend.RequestSchema do

  def validate(json) do
    get_schema()
    |> ExJsonSchema.Validator.validate(json)
  end

  def valid?(json) do
    get_schema()
    |> ExJsonSchema.Validator.valid?(json)
  end

  defp get_schema() do
    # todo: caching of this schema across requests
    get_schema_json() |> resolve()
  end

  defp get_schema_json() do
    %{
      "type" => "object",
      "properties" => %{
        "user_id" => %{
          "type" => "string"
        },
        "contest_id" => %{
          "type" => "string"
        },
        "participant_id" => %{
          "type" => "string"
        },
        "choices" => %{
          "type" => "array",
          "items" => %{
            "type" => "string"
          }
        },
        "rating_value" => %{
          "type" => "integer"
        },
        "subratings" => %{
          "type" => "array",
          "items" => %{
            "type" => "object",
            "properties" => %{
              "subrating_id" => %{
                "type" => "string"
              },
              "value" => %{
                "type" => "integer"
              }
            },
            "required" => [
              "subrating_id",
              "value"
            ]
          }
        },
        "free_vote" => %{
          "type" => "integer"
        },
        "silver_vote" => %{
          "type" => "integer"
        },
        "star_vote" => %{
          "type" => "integer"
        }
      },
      "required" => [
        "user_id",
        "contest_id",
        "participant_id"
      ]
    }
  end

  defp resolve(schema_json) do
    schema_json |> ExJsonSchema.Schema.resolve
  end
end
