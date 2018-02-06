defmodule ChoicelyFrontendWeb.MessageView do
  use ChoicelyFrontendWeb, :view

  def render("index.json", %{data: data}) do
    data
  end
end
