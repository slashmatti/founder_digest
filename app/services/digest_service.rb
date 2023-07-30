class DigestService
    attr_reader :user

    def initialize(user)
        @user = user
    end

    def call
        UserMailer.digests(user, stakeholder_updates).deliver
    end

    def stakeholder_updates
        user.subscribers.map(&:project).map(&:latest_stakeholder_update)
    end
end