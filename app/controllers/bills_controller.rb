class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /bills
  def index
    #was @bills = Bill.all
    @bills = Bill.where user: @user.id

    render json: @bills
  end

  # GET /bills/1
  def show
    render json: @bill
  end

  # POST /bills
  def create
    @bill = Bill.new(bill_params)
    @bill.user = @user

    if @bill.save
      render json: @bill, status: :created, location: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bills/1
  def update
    if @bill.update(bill_params)
      render json: @bill
    else
      render json: @bill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bills/1
  def destroy
    @bill.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:title, :date, :body, :user_id)
    end
end

#after date was :string, 
