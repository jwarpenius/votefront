defmodule ChoicelyVotefront.MessageViewTest do
  use ChoicelyVotefront.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders index.json" do
    data = %{test: true}
    assert render(ChoicelyVotefront.MessageView, "index.json", %{data: data}) ==
           data
  end
end
