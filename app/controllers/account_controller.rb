class AccountController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flashes

  def index
  end

  def update
    current_user.update(account_update_params)
    sign_in(current_user, bypass: true) # prevents user from needing to log back in
    redirect_to account_index_path, notice: 'Profile updated successfully'
  end

  private

  def account_update_params
    params.require(:user).permit(:email, :password)
  end

  def set_flashes
    if params[:subscribed] == 'true'
      current_user.delay.set_stripe_subscription
      flash.now[:notice] = 'Your account is now active!'
    end

    flash.now[:alert] = 'Subscription declined' if params[:aborted] == 'true'
    flash.now[:notice] = 'Subscription updated successfully' if params[:updated] == 'true'
  end
end
