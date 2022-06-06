class ApplicationsController < ApplicationController

  def new
    @application = Application.new
    @childcare = Childcare.find(params[:childcare_id])
  end

  def create

  end

  private

  def list_params
    params.require(:application).permit(:childcare_id, :start_date,)
  end

end
