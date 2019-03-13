Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :photos
  get "/staticpages/:staticpage" => "staticpages#show", as: :static
  root to: 'photos#index'
end
