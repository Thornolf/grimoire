Rails.application.routes.draw do
  root "missions#index"

  devise_for :users

  resources :missions do
    resources :handouts
    resources :character_sheets

    post "add_handout", to: "missions#add_handout", as: "add_handout_to"
  end

  resources :character_sheets, only: [ :index ]
end
