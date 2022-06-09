class ChildcaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @childcares = Childcare.all

    @markers = @childcares.geocoded.map do |childcare|
      {
        lat: childcare.latitude,
        lng: childcare.longitude,
        info_window: render_to_string(partial: "info_window", locals: { childcare: childcare }),
        image_url: helpers.asset_url("map2.png")
      }
    end
  end

  def show
    @childcare = Childcare.find(params[:id])
  end

  # def childcare_params
  #   params.require(:childcare).permit(:name, :email, :address, :url, :description, :created_at, :updated_at, :photo)
  # end
end
