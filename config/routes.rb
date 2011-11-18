ReaderRecovery::Application.routes.draw do
  resources :uploads
  resources :notes
  resources :tags
  root :to => 'home#index'
end
