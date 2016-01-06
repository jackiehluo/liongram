class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy,
                                   :confirm_payment, :confirm_delivery]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(:delivered => false).paginate(:page => params[:page],
                                                        :per_page => 20)
  end

  def past_index
    @orders = Order.where(:delivered => true).paginate(:page => params[:page],
                                                      :per_page => 20)
  end

  # GET /my_orders
  def user_index
    @current_orders = @current_user.orders.where(:delivered => false).paginate(
                                                        :page => params[:page],
                                                        :per_page => 10)
    @past_orders = @current_user.orders.where(:delivered => true).paginate(
                                                        :page => params[:page],
                                                        :per_page => 10)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @users = User.all
  end

  # GET /orders/1/edit
  def edit
    @users = User.all
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @user = User.find(params[:user_id][:id])
    @user.orders << @order

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @user = User.find(params[:user_id][:id])
    @user.orders << @order
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def confirm_payment
    if @order.confirm_payment
      OrdersMailer.payment_confirmation(@order).deliver_now
      flash[:success] = "Payment confirmation sent!"
      redirect_to root_url
    else
      flash[:error] = "That didn't work!"
      redirect_to root_url
    end
  end

  def confirm_delivery
    if @order.confirm_delivery
      OrdersMailer.delivery_confirmation(@order).deliver_now
      flash[:success] = "Delivery confirmation sent!"
      redirect_to root_url
    else
      flash[:error] = "That didn't work!"
      redirect_to root_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:buyer_name, :buyer_email, :recipient_name,
                                    :recipient_address, :date, :number,
                                    :items, :message, :anonymous,
                                    :venmo_username)
    end
end
