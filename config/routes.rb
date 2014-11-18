Rails.application.routes.draw do
  root 'samples#index'

  resources :principal_investigators

  resources :projects

  resources :samples do
    collection { post :import }
  end
end
