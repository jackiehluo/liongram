class HooksController < ApplicationController
  skip_before_filter :require_user
  skip_before_filter :verify_authenticity_token, :only => [:new_order_callback]

  def new_order_callback
    order = Order.new(:buyer_name => params['Field1'])
    order.save!
    head 200, content_type: "text/html"
  end
end
