Rails.application.routes.draw do
  root "missions#index"

  devise_for :users

  resources :missions do
    resources :handouts
    resources :character_sheets

    post "add_handout", to: "missions#add_handout", as: "add_handout_to"
    delete "remove_handout/:handout_id", to: "missions#remove_handout", as: "remove_handout_from"

    post "add_character_sheet", to: "missions#add_character_sheet", as: "add_character_sheet_to"
    delete "remove_character_sheet/:character_sheet_id", to: "missions#remove_character_sheet", as: "remove_character_sheet_from"
  end

  resources :character_sheets, only: [ :index ]
end
