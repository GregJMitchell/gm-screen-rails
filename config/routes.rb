Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :campaigns do
    resources :player_characters, controller: 'campaigns/player_characters'
    resources :non_player_characters, controller: 'campaigns/non_player_characters'
    resources :cities, controller: 'campaigns/cities'
    resources :factions, controller: 'campaigns/factions'
    resources :storylines, controller: 'campaigns/storylines'
    resources :quests, controller: 'campaigns/quests'
  end
end
