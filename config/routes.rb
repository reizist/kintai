Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :attendances do
        post "/" , :action => "record"
      end
    end
  end
end
