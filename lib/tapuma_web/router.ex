defmodule TapumaWeb.Router do
  use TapumaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TapumaWeb do
    pipe_through :api
    resources "/people", PeopleController, except: [:new, :edit]

    resources "/drivers", DriverController, except: [:new, :edit]

    resources "/owners", OwnerController, except: [:new, :edit]

    resources "/passengers", PassengerController, except: [:new, :edit]

    resources "/cops", CopController, except: [:new, :edit]

    resources "/travels", TravelController, except: [:new, :edit]

    resources "/cars", CarController, except: [:new, :edit]
  end
end
