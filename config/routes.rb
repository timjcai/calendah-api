Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
      resources :calendars do
        get '/events/:start_date/:end_date', to: 'events#date_range'  
        resources :events

      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
