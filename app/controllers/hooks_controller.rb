class HooksController
  def new_order_callback
    puts params.inspect
    order = Order.new(:buyer_name => params[:Field1])
    head 200, content_type: "text/html"
  end
end
