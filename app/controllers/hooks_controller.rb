class HooksController
  def new_order_callback
  order = Order.new(:buyer_name => params[:Field1] + " " + params[:Field2])
  order.save!
  end
end
