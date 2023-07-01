class UserSubmissionMailer < ApplicationMailer
    def reject(user_submission)
        @name = user_submission.name
        mail(to: user_submission.email, subject: "Sorry, you were rejected")
    end

    def approve(user_submission, pw)
        @name = user_submission.name
        @email = user_submission.email
        @pw = pw
        mail(to: user_submission.email, subject: "Congrats, you were accepted")
    end
end