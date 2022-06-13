class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def destroy
    # current_user.all_favorited.find(params[:id].to_i)

    redirect_to shortlist_path
  end
end
