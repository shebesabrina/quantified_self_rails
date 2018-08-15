Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: [:new, :edit]
      resources :meals, only: [:index]
      get '/meals/:id/foods', to: 'meals#show'
    end
  end
end
