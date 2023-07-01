module Onboardable
  extend ActiveSupport::Concern

  def finished_onboarding?
    stripe_subscription_id?
  end

end
