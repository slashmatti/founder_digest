class ProjectsController < ApplicationController
    def create
        current_user.projects.create!(project_submission_params)
        redirect_to dashboard_path
    end

    private

    def project_submission_params
        params.require(:project).permit(:title, :description)
    end
end
