defmodule TapumaWeb.Router do
  use TapumaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TapumaWeb do
    pipe_through :api
    resources "/car", CarController, except: [:new, :edit]
  end
end
