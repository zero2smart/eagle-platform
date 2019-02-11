class ApplicationController < ActionController::Base

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  helper_method :current_vendor, :current_vendor_name
  def current_vendor
    current_user && current_user.vendor
  end

  def current_vendor_name
    current_user && current_user.vendor && current_user.vendor.name
  end

  def paginate_params
    {page: params[:page], per_page: 10}
  end

end
