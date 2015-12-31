class OrdersMailer < ActionMailer::Base
  default :from => "Liongram <hello@liongram.com>"

  def payment_confirmation(order)
    @order = order
    mail(:to => "#{order.buyer_name} <#{order.buyer_email}>",
         :subject => "Liongram: Payment Confirmation")
  end

  def delivery_confirmation(order)
    @order = order
    mail(:to => "#{order.buyer_name} <#{order.buyer_email}>",
         :subject => "Liongram: Delivery Confirmation")
  end
end
