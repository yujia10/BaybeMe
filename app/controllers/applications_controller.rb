class ApplicationsController < ApplicationController

  def index

  end

  def new
    @application = Application.new
  end

  def create
    raise
    @applications = []

    current_user.all_favorited.each do |childcare|
      @application = Application.new
      @application.childcare = childcare
      @application.child = current_user.children.first
      @application.save
      @applications << @application
    end
      ChildcareMailer.with(applications: @applications, user:current_user).new_childcare_email.deliver_now
      redirect_to root_path, notice: "Added to my wishlist"

    def destroy
      @application = Application.find(params[:application_id])
      @application.destroy
      redirect_to childcare_applications_path(params[:childcare_id])
    end

  end

  private

  def list_params
    params.require(:application).permit(:child_id, :start_date)
  end

end


# @booking.start_date = Date.parse(list_params[:date][0..9])

# start_date = Date.parse(list_params[:start_date])
