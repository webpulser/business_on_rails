BusinessOnRails::Application.routes.draw do

  root :to => 'pages#index'
  resources :sites
  resource :contact

  resources :users do
    collection do
      get :logins
    end
  end

  namespace :admin do
    resources :sites do
      member do
        post :activate
        get :duplicate
      end
    end

    resources :site_categories, :controller => 'categories', :type => 'site_category'
  end

  mount Forgeos::Core::Engine => '/', :as => 'forgeos_core'
  mount Forgeos::Cms::Engine => '/', :as => 'forgeos_cms'

end
