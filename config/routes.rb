Rails.application.routes.draw do
  resources :posts
  get 'welcome/index'
  resources :articles, only: [:index, :show]
  root 'welcome#index'
end
