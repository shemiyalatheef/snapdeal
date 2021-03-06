class CarriersController < ApplicationController
  
  def new
  	
  	@carrier = Carrier.new
  end

  	def create
		@carrier = Carrier.new(carrier_params)
 
    respond_to do |format|
      if @carrier.save
        # Tell the UserMailer to send a welcome email after save
        CarrierMailer.carrier_email(@carrier).deliver
 
        format.html { redirect_to(new_carrier_path, notice: 'Resume has been successfully uploaded.') }
        format.json { render json: @carrier, status: :created, location: @carrier }
      else
        format.html { render action: 'new' }
        format.json { render json: @carrier.errors, status: :unprocessable_entity }
      end
    end
 end
 private
	def carrier_params
		params.require(:carrier).permit(:firstname,:lastname,:city,:country,:email,:phone,:resume,:image)
	end
	
  
end
