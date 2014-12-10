class OrderWorker
  include Sidekiq::Worker

  def perform(order_id)
    order = Order.find_by(id: order_id)
    if order
      # TODO: order.process
      Rails.logger.info "Processing order #{order.id}"
    else
      Rails.logger.error "Could not find order with ID=#{order_id}"
    end
  end
end

if @order.save
  redirect_to @order, 'We are processing your order'
end
