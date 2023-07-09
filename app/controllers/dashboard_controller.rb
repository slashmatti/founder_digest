class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index
    # GET project here, to render on the frontend
    @project = current_user.projects.first
    @other_projects = Project.all
  end

  private

  def set_flashes
    if params[:subscribed] == 'true'
      current_user.delay.set_stripe_subscription
      flash.now[:notice] = 'Your account is now active!'
    end
  end
end
