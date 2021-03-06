class BillingsController < ApplicationController
  before_action :set_billing, only: [:show, :edit, :update, :destroy]
  before_action :admin_signed_in?, except: [:new]

  # GET /billings
  # GET /billings.json
  def index
    @billings = Billing.all.paginate(page: params[:page], per_page: 5).order("created_at DESC")
  end

  # GET /billings/1
  # GET /billings/1.json
  def show
  end

  # GET /billings/new
  def new
    @billing = Billing.new
  end

  # GET /billings/1/edit
  def edit
  end

  # POST /billings
  # POST /billings.json
  def create
    if user_signed_in?
      @billing = Billing.new(billing_params)
      @billing.user_id = current_user.id
      get_last_meter
      @billing.payment = "#{@payment}"
    end
    respond_to do |format|
      if @billing.save
        #system('curl -X POST -d "notification[phone]=mynumber" -d "notification[body]=mymessage" -d "notification[source_app]=myapp" http://localhost:3001/notifications')
        format.html { redirect_to @billing, notice: 'Billing was successfully created.' }
        format.json { render :show, status: :created, location: @billing }
      else
        format.html { render :new }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billings/1
  # PATCH/PUT /billings/1.json
  def update
    respond_to do |format|
      if @billing.update(billing_params)
        format.html { redirect_to @billing, notice: 'Billing was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing }
      else
        format.html { render :edit }
        format.json { render json: @billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billings/1
  # DELETE /billings/1.json
  def destroy
    @billing.destroy
    respond_to do |format|
      format.html { redirect_to billings_url, notice: 'Billing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing
      @billing = Billing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_params
      params.require(:billing).permit(:pic)
    end
    def picture_params
      params.require(:billing).permit(:pic)
    end
    def get_last_meter
      past_bill = Billing.where(user_id: "#{current_user.id}").last
      #if past_bill.nil?
      @payment = past_bill.meter_number
      # else
      #   @payment = "0"
      # end
      puts "#{past_bill.meter_number} *****************"
      puts "******************#{@payment}"
    end
end
