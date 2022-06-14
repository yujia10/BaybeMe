class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def destroy
    @childcare = Childcare.find(params[:id])
    current_user.unfavorite(@childcare)
    redirect_to shortlist_path
  end
end
