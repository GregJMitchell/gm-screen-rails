Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :campaigns do
    resources :player_characters, except: %i[index], controller: 'campaigns/player_characters'
    resources :non_player_characters, except: %i[index], controller: 'campaigns/non_player_characters'
  end
end
