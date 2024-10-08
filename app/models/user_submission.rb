class UserSubmission < ApplicationRecord
    include RandomStringable

    PLAN_NAMES = ['free', 'pro']

    validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text
    validates :plan_name, inclusion: { in: PLAN_NAMES }

    after_update :finish_processing

    def name
        "#{first_name} #{last_name}"
    end

    def finish_processing
        reject! if status == 'Reject'
        approve! if status == 'Approve'
    end

    def reject!
        UserSubmissionMailer.reject(self).deliver
    end

    def approve!
        temp_password = generate_random_string
        created_user = User.create!(email: self.email, first_name: self.first_name, last_name: self.last_name, plan_name: self.plan_name, password: temp_password)
        created_user.projects.create!(website: self.website)
        UserSubmissionMailer.approve(self, created_user, temp_password).deliver
    end

end
