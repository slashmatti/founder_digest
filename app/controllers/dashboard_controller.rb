class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :maybe_subscribe

  def index
    # GET project here, to render on the frontend
    @project = current_user.default_project
    @other_projects = Project.except(@project).ready
  end
end
