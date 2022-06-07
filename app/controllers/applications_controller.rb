class ApplicationsController < ApplicationController

  def new
    @application = Application.new
    @childcare = Childcare.find(params[:childcare_id])
  end

  def create
    @childcare = Childcare.find(params[:childcare_id])
    @child = Children.find(params[:child_id]) # need to sdjust for more than 1 kid application
    @application = Application.new(list_params)
    @application.childcare = @childcare
    @application.child = @child
    if  @application.save
      redirect_to root_path, notice: "Application send"
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:application).permit(:childcare_id, :child_id,:start_date)
  end

end
