class ApplicationsController < ApplicationController

  def index
    @applications.Application.all
  end

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
      redirect_to root_path, notice: "Added to my wishlist"
    else
      render :new
    end

    def destroy
      @application = Application.find(params[:application_id])
      @application.destroy
      redirect_to childcare_applications_path(params[:childcare_id])
    end

  end

  private

  def list_params
    params.require(:application).permit(:childcare_id, :child_id,:start_date)
  end

end
