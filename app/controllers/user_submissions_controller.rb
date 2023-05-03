class UserSubmissionsController < ApplicationController
    def create
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        UserSubmission.create!(user_submission_params)
        # TODO: redirect to a thank you-page
        redirect_to root_path, notice: 'Thanks! Your application was received.'
    end

    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :job_role, :text, :plan_name)
    end
end
