defmodule ChoicelyFrontendWeb.Router do
  use ChoicelyFrontendWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ChoicelyFrontendWeb do
    pipe_through :api

    post "/", MessageController, :post
  end

  # Other scopes may use custom stacks.
  # scope "/api", ChoicelyFrontendWeb do
  #   pipe_through :api
  # end
end
