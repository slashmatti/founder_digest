class Admin::UserSubmissionsController < ApplicationController
    before_action :set_user_submission

    def update
        @user_submission.update(user_submission_params)
        redirect_to admin_path, notice: 'User submission updated successfully'
    end

    private

    def user_submission_params
        params.require(:user_submission).permit(:status)
    end

    def set_user_submission
        @user_submission = UserSubmission.find(params[:id])
    end
end
