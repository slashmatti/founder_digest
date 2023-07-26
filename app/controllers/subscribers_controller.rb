class SubscribersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authenticate_user!
    before_action :set_subscriber, only: [:destroy]

    def create
        subscriber = current_user.subscribers.create!(subscriber_params)
        render json: { status: 'ok', subsriber_id: subscriber.id, project_id: subscriber.project_id }
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
end