Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :foods, except: [:new, :edit]
      resources :meals, only: [:index]
      namespace :meals do
        get '/:id/foods', to: 'foods#index'
      end
    end
  end
end
