class UpdatesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_stakeholder_update

    def show
    end

    private

    def set_stakeholder_update
        @stakeholder_update = StakeholderUpdate.find_by(uuid: params[:id])
    end

    def stakeholder_update_params
        params.require(:stakeholder_update).permit(:title, :content, :confirmed_at)
    end

end