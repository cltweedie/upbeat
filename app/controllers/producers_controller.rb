class ProducersController < ApplicationController

  def update
    if params[:seller]
      current_producer.type = "Seller"
      current_producer.save!
      flash[:notice] = "Thank you for registering as a seller."
    end
    # rendering javascript as any redirect uses PUT http verb
    render nothing: true
    # render js: "window.location = #{account_producer_url(current_producer).to_json}"
  end

end
