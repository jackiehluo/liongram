class HooksController
  def new_order_callback
    log(request.body.read)
    order = Order.new(:buyer_name => params[:Field1])
    order.save!
  end
end
