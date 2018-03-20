defmodule ChoicelyVotefront.MessageView do
  use ChoicelyVotefront, :view

  def render("index.json", %{data: data}) do
    data
  end
end
