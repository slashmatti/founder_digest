class DigestService
    attr_reader :user

    def initialize(user)
        @user = user
    end

    def self.perform
        User.subscribed.each { |u| new(u).call }
    end

    def call
        return unless wrote_recent_update?
        UserMailer.digests(user, stakeholder_updates).deliver
    end

    def wrote_recent_update?
        user.stakeholder_updates.this_period.confirmed.count > 0
    end

    def stakeholder_updates
        user.subscribers.map(&:project).map(&:latest_stakeholder_update)
    end
end