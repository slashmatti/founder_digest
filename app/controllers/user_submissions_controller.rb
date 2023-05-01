class UserSubmissionsController < ApplicationController
    def create
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        UserSubmission.create!(user_submission_params)
        # redirect_to root_path
    end

    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :job_role, :text)
    end
end

# what params will look like!
# params = {authenticity_token: 'asdffd', user_submission: {first_name: 'asdfdf'}}
