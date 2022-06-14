class ChildcaresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    if $childcares.nil? || params[:query].present?
      if params[:query].present?
        $childcares = []
        if  (params[:query] == "Melbourne" || params[:query] == "Richmond" || params[:query] == "3121")
          $childcares = Childcare.where("address ILIKE ?", "%VIC%")
        else
          $childcares = Childcare.where("address ILIKE ?", "%#{params[:query]}%")
        end
      else
        $childcares = Childcare.all
      end
    end

    @markers = $childcares.geocoded.map do |childcare|
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
    @markers =[
      {
        lat: @childcare.latitude,
        lng: @childcare.longitude,
        info_window: render_to_string(partial: "info_window", locals: { childcare: @childcare }),
        image_url: helpers.asset_url("map2.png")
      }
    ]
  end

  def toggle_favorite
    @childcare = Childcare.find(params[:id])
    current_user.favorited?(@childcare) ? current_user.unfavorite(@childcare) : current_user.favorite(@childcare)
  end

end
