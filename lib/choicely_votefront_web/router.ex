defmodule ChoicelyVotefront.Router do
  use ChoicelyVotefront, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChoicelyVotefront do
    pipe_through :api

    post "/", MessageController, :post
  end
end
