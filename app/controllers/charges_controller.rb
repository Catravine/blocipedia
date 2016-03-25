class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 1500

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Blocipedia Premium Account',
      :currency    => 'usd'
    )

    # Change the Account
    current_user.premium!

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

  def downgrade_account
    user = User.find(params[:user_id])
    if user.downgrade! 
      flash[:notice] = 'Downgraded'
    else
      flash[:notice] = 'Downgrade failed'
    end
    redirect_to wikis_path
  end
end
