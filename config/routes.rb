Rails.application.routes.draw do
  root "missions#index"

  devise_for :users

  resources :missions do
    resources :handouts
    resources :character_sheets do
      delete "remove_inventory_item/:inventory_id", to: "missions#remove_inventory_item", as: "remove_inventory_item_from"
      post "add_inventory_item", to: "missions#add_inventory_item", as: "add_inventory_item_to"
    end

    resources :sounds do
      post "play", on: :member
    end

    post "add_handout", to: "missions#add_handout", as: "add_handout_to"
    delete "remove_handout/:handout_id", to: "missions#remove_handout", as: "remove_handout_from"

    post "add_sound", to: "missions#add_sound", as: "add_sound_to"
    delete "remove_sound/:sound_id", to: "missions#remove_sound", as: "remove_sound_from"

    post "add_character_sheet", to: "missions#add_character_sheet", as: "add_character_sheet_to"
    delete "remove_character_sheet/:character_sheet_id", to: "missions#remove_character_sheet", as: "remove_character_sheet_from"
  end

  resources :conditions, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :weapons, only: [ :index, :new, :create, :edit, :update, :destroy, :show  ]
  resources :sounds, only: [ :index, :new, :create, :edit, :update, :destroy, :show ]
  resources :skills, only: [ :index, :new, :create, :edit, :update, :destroy ]
  resources :items, only: [ :index, :new, :create, :edit, :update, :destroy ]

  resources :character_sheets do
    resources :inventories, only: [ :new, :create, :edit, :update, :destroy, :show ]

    member do
      post "add_condition", to: "character_sheets#add_condition", as: "add_condition_to"
      delete "remove_condition/:condition_id", to: "character_sheets#remove_condition", as: "remove_condition_from"
    end
  end
end
