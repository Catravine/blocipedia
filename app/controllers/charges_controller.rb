class ChargesController < ApplicationController
  protect_from_forgery :except => :webhook

  def webhook
    # Process webhook data in `params`
  end

  def new
  end

  def create

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
      :plan => "premium"
    )

    # charge = Stripe::Charge.create(
    #   :customer    => customer.id,
    #   :amount      => @amount,
    #   :description => 'Blocipedia Premium Account',
    #   :currency    => 'usd'
    # )

    # Change the Account
    current_user.premium!

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def downgrade_account
    user = current_user
    if user.downgrade!
      flash[:notice] = "Subscription ended, all private wikis now public."
      customer = Stripe::Customer.retrieve({CUSTOMER_ID})
      customer.subscriptions.retrieve({SUBSCRIPTION_ID}).delete
    else
      flash.now[:alert] = "There was an error downgrading.  Please try again."
    end
    redirect_to wikis_path
  end

end
