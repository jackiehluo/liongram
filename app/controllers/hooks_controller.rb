class HooksController < ApplicationController
  skip_before_filter :require_user
  skip_before_filter :verify_authenticity_token, :only => [:new_order_callback]

  def new_order_callback
    order = Order.new(:buyer_name => "#{params[:Field1]} #{params[:Field2]}")
    order.buyer_email = params[:Field5]
    order.recipient_name = "#{params[:Field3]} #{params[:Field4]}"
    order.recipient_address = params[:Field12]
    order.date = Date.strptime(params[:Field232], "%Y%m%d")
    order.items = "#{params[:Field116]} #{params[:Field221]}"
    if params[:Field119]
      order.items << "<br>#{params[:Field119]} #{params[:Field222]}"
    end
    if params[:Field118]
      order.items << "<br>#{params[:Field118]} #{params[:Field223]}"
    end
    if params[:Field117]
      order.items << "<br>#{params[:Field117]} #{params[:Field224]}"
    end
    order.message = params[:Field234]
    order.anonymous = params[:Field336]
    order.venmo_username = params[:Field230]
    order.save!
    head 200, content_type: "text/html"
  end
end
