class ChargesController < ApplicationController

  def create
    @amount = params[:price].to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Sample pack',
      :currency    => 'gbp'
    )

    Purchase.create!(producer_id: current_producer.id,
                    sample_pack_id: params[:sample_pack])

    redirect_to sample_pack_path(params[:sample_pack])

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
