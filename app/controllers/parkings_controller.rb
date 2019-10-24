class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :update, :destroy]

  # GET /parkings
  def index
    @parkings = Parking.all

    render json: @parkings, status: :ok
  end

  # GET /parkings/1
  def show
    render json: @parking.plate_show, status: :ok
  end

  # POST /parkings
  def create
    @parking = Parking.new(parking_params)

    if @parking.save
      render json: {reserva: @parking.id}, status: :created, location: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parkings/1
  def update
    if @parking.update(parking_params)
      render json: @parking, status: :ok
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PUT /parkings/1/out
  def out
    out = set_parking()
    if out.paid == true
      out.update_attributes!(left: true)
      out.update_attributes!(time: time_diff(Time.now, out.created_at) )
      render json: out.plate_show, status: :ok
    else
      render json: {paid_status: "Placa sem pagamento efetuado"}, status: :payment_required
    end
  end

  #PUT /parking/1/pay
  def pay
    pay = set_parking()
    pay.update_attributes!(paid: true)
    render json: pay.plate_show, status: :ok
  end

  # GET /historic/FAA-1234
  def historic
    plate_param = params[:plate]
    plate = Parking.where(plate: plate_param.to_s)
    render json: plate, status: :ok
  end

  # DELETE /parkings/1
  def destroy
    @parking.destroy
  end

  def time_diff(start_time, end_time)
    seconds_diff = (start_time - end_time).to_i.abs

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60
    seconds_diff -= minutes * 60

    seconds = seconds_diff
    "#{hours.to_s.rjust(2, '0')}:#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = Parking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def parking_params
      params.require(:parking).permit(:plate, :paid, :left, :time)
    end
end
