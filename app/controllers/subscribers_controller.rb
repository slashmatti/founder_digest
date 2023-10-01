class SubscribersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :set_subscriber, only: [:destroy]

    def create
        subscriber = current_user.subscribers.new(subscriber_params)

        if subscriber.save
            response_params = { success: true, subscriber_id: subscriber.id }
        else
            response_params = { success: false, error: subscriber.errors.full_messages.join }
        end

        render json: response_params
    end

    def destroy
        @subscriber.destroy
        render json: { status: 'ok'}
        # TODO: RENDER back json data
    end

    private

    def set_subscriber
        @subscriber = current_user.subscribers.find(params[:id])
    end

    def subscriber_params
        params.require(:subscriber).permit(:project_id)
    end

    def discount_cannot_be_greater_than_total_value
        unless current_user.pro_plan?
          errors.add(:discount, "can't be greater than total value")
        end
      end
end