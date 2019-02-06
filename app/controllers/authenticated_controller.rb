class AuthenticatedController < ApplicationController
  before_action :authenticate_user!
  
  layout 'dashboard'
  
  private

end