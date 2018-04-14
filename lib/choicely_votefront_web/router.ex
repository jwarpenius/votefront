defmodule ChoicelyVotefront.Router do
  use ChoicelyVotefront, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ChoicelyVotefront do
    pipe_through :api

    post "/", MessageController, :post
    get "/", MessageController, :health

  end
end
