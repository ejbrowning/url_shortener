Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

   # sending GET requests for /encode to the encode method in the EncodeDecodeController
  get "/encode", to: "encode_decode#encode"
   # sending GET requests for /decode to the decode method in the EncodeDecodeController
  get "/decode", to: "encode_decode#decode"
end
