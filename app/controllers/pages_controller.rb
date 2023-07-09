class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:start, :logout]

  def home
  end

  def apply
  end

  def thanks
  end

  def magic_login
    user = User.find_by(auth_code: params[:auth_code])
    if user
      sign_in(user)
      redirect_to start_path
    else
      redirect_to user_session_path, alert: "User not found. Please log in manually."
    end
  end

  def start
    @project = current_user.projects.first
    
    if (@project.title? && @project.description?)
      redirect_to dashboard_path, notice: "You already created your project."
    end
  end

  def logout
    sign_out(current_user)
    redirect_to root_path
  end

  def page
    @page_key = request.path[1..-1]
    render "pages/#{@page_key}"
  end
end
