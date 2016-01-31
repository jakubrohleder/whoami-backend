Rails.application.routes.draw do
  jsonapi_resources :users
  jsonapi_resources :conversations do
    jsonapi_related_resource :messages
  end
  jsonapi_resources :messages

  mount ActionCable.server => '/cable'
end
