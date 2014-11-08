class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  before_filter :reject_user, :except => [:reject]
  
  def index
  end

  def reject    
  end
end
