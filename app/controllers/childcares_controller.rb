class ChildcaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @childcares = Childcare.all
  end

  def show
    @childcare = Childcare.find(params[:index])
  end
end
