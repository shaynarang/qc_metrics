Rails.application.routes.draw do
  root 'samples#index'

  resources :samples do
    collection { post :import }
  end
end
