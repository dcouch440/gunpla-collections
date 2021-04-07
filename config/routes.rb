Rails.application.routes.draw do

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'gunplas#index'

  get '/users/:id/collection', to: 'gunplas#collection'

  # post 'sign-in', to: 'sessions#sign_in'
  # delete 'sign-out', to: 'sessions#sign_out'

  resources :gunplas, only: [:index, :show] do
    post 'collection', to: 'gunplas#add_collection'
    resources :reviews, except: [:index]
  end

end
