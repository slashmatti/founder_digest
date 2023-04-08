class Admin::PagesController < ApplicationController
    before_action :authenticate_user!, only: [:logout]

    def dashboard
    end
  end
  