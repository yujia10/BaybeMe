class ApplicationsController < ApplicationController

  def index
    @applications.Application.all
  end

  def new
    @application = Application.new
  end

  def create
    # @childcare = Childcare.find(params[:childcare_id])
    @application = Application.new
    # @application.childcare = @childcare
    # @application.child = current_user.children.first
    ChildcareMailer.with(childcare: @childcare).new_childcare_email.deliver_now
    if @application.save
      ChildcareMailer.with(childcare: @childcare).new_childcare_email.deliver_now
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
    params.require(:application).permit(:childcare_id)
  end

end
