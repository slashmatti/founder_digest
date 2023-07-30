class UserMailer < ApplicationMailer
    def digests(user, stakeholder_updates)
        @stakeholder_updates = stakeholder_updates
        @name = user.first_name
        # grab all of user's stakeholder updates subscriptions
        # link to each of them, including the founder's contact details
        mail(to: user.email, subject: 'Your Founder Digests are here')
    end
end
