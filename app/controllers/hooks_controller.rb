class HooksController
  def new_order_callback
    puts params.inspect
    order = Order.new(:buyer_name => params[:Field1])
    order.save!
    render :nothing => true
  end
end
