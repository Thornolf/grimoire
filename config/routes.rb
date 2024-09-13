Rails.application.routes.draw do
  root "missions#index"

  devise_for :users

  resources :missions do
    resources :handouts
    resources :character_sheets
  end

  resources :character_sheets, only: [ :index ]
end
