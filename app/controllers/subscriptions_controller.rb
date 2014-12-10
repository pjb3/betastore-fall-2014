class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to new_subscription_path, notice: 'Subscription was successfully created.'
    else
      render action: 'new'
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
