Rails.application.routes.draw do
  get "/carparks/nearest", to: "carpark#show"
end
