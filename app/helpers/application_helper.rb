module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-soft-success", error: "alert-soft-danger", alert: "alert-soft-warning", notice: "alert-soft-info" }[flash_type] || "alert-info"
  end

  def bootstrap_icon_for flash_type
    { success: "check_circle", error: "warning", alert: "warning", notice: "info" }[flash_type] || ""
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type.to_sym)} d-flex", role: "alert") do 
              concat content_tag(:i, bootstrap_icon_for(msg_type.to_sym), class: "material-icons mr-3")
              concat content_tag(:div, message, class: "text-body")
              # concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
            end)
    end
    nil
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_nav_markup(page, markup=nil)
    if controller_name == page.to_s
      markup || content_tag(:span, "(current)", class: "sr-only") 
    end
  end
  
end
