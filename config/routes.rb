Rails.application.routes.draw do
  
  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  root to: "pages#home"

  devise_for :users, skip: [:registrations], controllers: {sessions: "sessions"} do
    # get 'forgot_password' => 'devise/passwords#new', as: :new_user_password
  end

  resource :dashboard, only:[:index], controller: :dashboard do
    get '', action: :index, as: ''

    resources :settings, only: [:index], controller: 'dashboard/settings'
    resources :trucks, only: [:index], controller: 'dashboard/trucks'
    resources :customers, only: [:index], controller: 'dashboard/customers'
    resources :materials, only: [:index], controller: 'dashboard/materials'
    resources :users, only: [:index], controller: 'dashboard/users'
    resources :locations, only: [:index], controller: 'dashboard/locations'
    resources :sales, only: [:index], controller: 'dashboard/sales'
    resource :billing, only: [:index], controller: 'dashboard/billing' do
      get '', action: :index, as: ''
    end
  end
  
  resource :dispatch, only: [:index], controller: 'dispatch' do
    get '', action: :index, as: ''
  end
  
  get 'theme/(:page)' => 'theme#show', as: 'theme'
end
