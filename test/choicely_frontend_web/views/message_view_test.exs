defmodule ChoicelyFrontendWeb.MessageViewTest do
  use ChoicelyFrontendWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.json" do
    params = %{test: true}
    assert render(ChoicelyFrontendWeb.MessageView, "index.json", %{params: params}) ==
           params
  end
end
