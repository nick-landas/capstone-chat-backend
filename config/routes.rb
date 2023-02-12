Rails.application.routes.draw do
  resources :alliances
  resources :fans
  resources :squads
  resources :messages
  # route to get new messages for the team
  get '/teams/:id/:datetime', to: 'teams#show'

  resources :squads, only: [:index, :show, :create, :update]
  resources :fans, only: [:index, :update, :create] do
    resources :alliances, only: [:index] # route to get teams data that the user is a member of
    resources :messages, only: [:index] # route to get messages the user can view
  end

  mount ActionCable.server => '/cable'
end
