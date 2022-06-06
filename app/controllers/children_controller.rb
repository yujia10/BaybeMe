class ChildrenController < ApplicationController
  before_action :find_child, only: [:show, :edit, :update, :destroy]
  def index
    @children = Child.all
  end

  def show
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(list_params)
    @child.user= current_user
    if @child.save
      redirect_to user_path(@child.user), notice: "Child added successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(list_params)
      redirect_to user_path(@child.user), notice: "Child Eddited successfully"
    else
      render :edit
    end

  end

  def destory
    @child.destroy
    redirect_to user_path(@child.user)
  end

  private

  def find_child
    @child = Child.find(params[:index])

  end

  def list_params
    params.require(:child).permit(:first_name, :last_name, :gender, :dob)
  end
end
