defmodule ChoicelyFrontendWeb.MessageView do
  use ChoicelyFrontendWeb, :view

  def render("index.json", %{params: params}) do
    params
  end

end
