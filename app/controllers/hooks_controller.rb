class HooksController
  def new_order_callback
    if params[:EntryID].present?
      order = Order.new(:buyer_name => params[:Field1] + " " + params[:Field2])
      survey.save!
    end
    render :nothing => true
  end
end
