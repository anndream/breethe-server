defmodule AirqualityWeb.Router do
  use AirqualityWeb, :router
  use Plug.ErrorHandler
  use Sentry.Plug

  pipeline :api do
    plug(:accepts, ["json-api"])
  end

  scope "/api", AirqualityWeb do
    pipe_through(:api)

    resources("/locations", LocationController, only: [:index, :show]) do
      resources("/measurements", MeasurementController, only: [:index])
    end
  end
end
