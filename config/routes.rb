Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'gunplas#index'

  post 'sign-in', to: 'sessions#sign_in'
  delete 'sign-out', to: 'sessions#sign_out'

  resources :users, except: [:index] do
    resources :gunplas, only: [:index, :show]
  end
  resources :gunplas, only: [:index, :show] do
    resources :reviews, except: [:index]
  end
end
