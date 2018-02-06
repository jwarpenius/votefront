defmodule ChoicelyFrontendWeb.Router do
  use ChoicelyFrontendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChoicelyFrontendWeb do
    pipe_through :api

    post "/", MessageController, :post
  end
end
