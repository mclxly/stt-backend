class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  before_filter :reject_user, :except => [:reject]
  
  def index
  end

  def reject
    if !['new member', 'banned'].include?( current_user.role.name )
      redirect_to dashboard_index_path(@user)
    end
  end
end
