Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                  sessions: 'users/sessions',
                  registrations: 'users/registrations'
              }
  get '/member-data', to: 'members#show'
  
  resources :groups, only: [:index, :create, :update, :show, :destroy] do 
    member do
      patch :update_group_users
    end
  end 

  resources :categories
end
