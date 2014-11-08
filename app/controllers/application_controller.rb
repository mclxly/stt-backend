class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :layout_by_resource

  # before_filter :reject_user

  private

  def layout_by_resource
    if devise_controller?
      "layout_for_devise"
    else
      "application"
    end
  end

  protected

  def reject_user
    if user_signed_in?
      if current_user.role.name == 'new member'        
        redirect_to dashboard_reject_path(@user), flash: { alert: 'Rejct Access! Your account is still waiting for approve.'}
      end
      if current_user.role.name == 'banned'        
        redirect_to dashboard_reject_path(@user), :flash => { :alert => 'Rejct Access! Your account is banned.'}
      end
    end
  end
end
