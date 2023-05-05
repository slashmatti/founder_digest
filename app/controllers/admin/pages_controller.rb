class Admin::PagesController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def dashboard
      @user_submissions = UserSubmission.all
    end
  end
  