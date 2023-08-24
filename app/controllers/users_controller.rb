class UsersController < ApplicationController

  skip_before_action :verify_authenticity_token
  def create
    @user = User.new(set_params)
    if @user.save
      render json: { message:"user Created", data: @user}
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def index
    @user=User.all
    render json: @user
  end

  def show
    @user = user.find_by_id(params[:id])
    if @user
      render json: @user
    else
      render json: {message: "not found users"}
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(set_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def destroy
    @user = User.find_by_id(params[:id])
    if @user
      @user.destroy
      render json: { message: "user successfully deleted" }
    else
      render json: {message: "user not found"}
    end
  end

  private
  def set_params
    params.permit(:first_name,:last_name,:address,:contact)
  end

end

