Rails.application.routes.draw do
  devise_for :admin_users, skip: [:sessions]
  devise_scope :admin_user do
    get  'login' => 'devise/sessions#new', as: :new_admin_user_session
    post 'login' => 'devise/sessions#create', as: :admin_user_session
    get  'logout' => 'devise/sessions#destroy', as: :destroy_admin_user_session
  end
  root 'home#index'

  devise_for :users, skip: [:sessions], controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get  'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get  'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :attendances do
        post "/" , :action => "record"
      end
    end
  end

  namespace :admin do
    get '/' => 'admin#index'
    resources :attendances, only: :index
  end
end
