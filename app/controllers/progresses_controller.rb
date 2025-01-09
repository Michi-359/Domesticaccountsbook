class ProgressesController < ApplicationController
  before_action :move_to_signed_in
  before_action :set_user

  def index
    @progresses = Progress.where(user_id: current_user.id)
  end

  def new
    @progress = Progress.new
  end

  def create
    @progress = Progress.new(progress_params)
    if @progress.save
      redirect_to :progresses
    else
      render :new
    end
  end

  def edit
    @progress = Progress.find(params[:id])
    if @progress.user_id != current_user.id
      redirect_to :progresses, notice: "この操作を行うことができません。"
    end
  end

  def update
    @progress = Progress.find(params[:id])
    if @progress.update(progress_params)
      redirect_to :progresses
    else
      render :edit
    end
  end

  def destroy
    @progress = Progress.find(params[:id])
    if @progress.user_id != current_user.id
      redirect_to :progresses, notice: "この操作を行うことができません。"
    else
      @progress.destroy
      redirect_to :progresses
    end
  end

  def set_user
    @user = current_user
  end

  private

  def progress_params
    params.require(:progress).permit(:purpose_of_saving, :monthly_savings, :months, :special_reserve, :target_amount, :user_id)
  end
end
