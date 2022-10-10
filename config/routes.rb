Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  root "home#index"

  resources :plumbers
  resources :events do 
    post :done

    collection do 
      get :certain_plumber_events
    end
  end
  resources :clients
end
