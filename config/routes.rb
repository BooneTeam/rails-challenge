Rails.application.routes.draw do

  scope :users do
    get '/tag_search', to: 'users#tag_search', as:'user_tag_search'
  end

  resources :users, only: [:index,:new,:create,:show, :update]
  resources :friendships, only: [:create]
  root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
