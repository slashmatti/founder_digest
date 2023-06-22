class Admin::PagesController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def dashboard
      @user_submissions = UserSubmission.all.order(created_at: :desc)
    end
  end
  