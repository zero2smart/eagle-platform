Rails.application.routes.draw do
  
  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  root to: "pages#home"

  devise_for :users, skip: [:registrations], controllers: {sessions: "sessions"} do
    # get 'forgot_password' => 'devise/passwords#new', as: :new_user_password
  end

  resource :dashboard, only:[:index], controller: :dashboard do
    get '', action: :index, as: ''

    resources :settings, only: [:index], controller: 'dashboard/settings' do

    end

  end
  
  get 'theme/(:page)' => 'theme#show', as: 'theme'
end
