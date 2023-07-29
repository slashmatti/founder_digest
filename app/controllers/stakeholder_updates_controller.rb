class StakeholderUpdatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project, except: [:new]
    before_action :set_stakeholder_update, except: [:new, :create]

    def new
        @stakeholder_update = StakeholderUpdate.new
    end

    def create
        stakeholder_update = @project.stakeholder_updates.create!(stakeholder_update_params)
        redirect_to stakeholder_update_path(stakeholder_update), notice: 'Stakeholder update created!'
    end

    def show
    end

    def update
        @stakeholder_update.update(stakeholder_update_params)
        redirect_to dashboard_path, notice: 'Stakeholder update will be shared soon!'
    end

    private

    def set_project
        @project = current_user.default_project
    end

    def set_stakeholder_update
        @stakeholder_update = @project.stakeholder_updates.find(params[:id])
    end

    def stakeholder_update_params
        params.require(:stakeholder_update).permit(:title, :content, :confirmed_at)
    end

end