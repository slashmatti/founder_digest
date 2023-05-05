class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # @users = User.all.order(created_at: :desc)
    @user_submissions = UserSubmission.all
  end
end
