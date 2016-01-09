module ProducersHelper
  def self.producer_is_this_one?(current_producer, params)
    current_producer && params[:producer_id].to_i == current_producer.id
  end
end
