Rails.application.routes.draw do
  get "/carparks/nearest", to: "carpark#show"
  get "*path" , to: "carpark#error"
end
