Rails.application.routes.draw do
  
  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#home"
  
  get 'theme/(:page)' => 'theme#show', as: 'theme'
end
