class ChildcaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @childcares = Childcare.all
  end

  def show
    @childcare = Childcare.find(params[:index])
  end

  def childcare_params
    params.require(:childcare).permit(:name, :email, :address, :url, :description, :created_at, :updated_at, :photo)
  end
end
