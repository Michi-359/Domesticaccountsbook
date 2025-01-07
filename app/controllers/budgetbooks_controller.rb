class BudgetbooksController < ApplicationController
  before_action :move_to_signed_in

  def index
    @budgetbooks = Budgetbook.where(user_id: current_user.id).order(created_at: :desc)
    @user = current_user
  end

  def new
    @budgetbook = Budgetbook.new
    @user = current_user
  end

  def create
    @budgetbook = Budgetbook.new(budgetbook_params)
    @user = current_user
    if @budgetbook.save
      redirect_to :budgetbooks, notice: '家計簿が追加されました。'
    else
      render :new, notice: '家計簿の追加に失敗しました。'
    end
  end

  def edit
    @budgetbook = Budgetbook.find(params[:id])
    @user = current_user
    if @budgetbook.user_id != current_user.id
      redirect_to :budgetbooks, notice: "この操作を行うことができません。"
    end
  end

  def update
    @budgetbook = Budgetbook.find(params[:id])
    @user = current_user
    if @budgetbook.update(budgetbook_params)
      redirect_to :budgetbooks, notice: '家計簿が更新されました。'
    else
      render "edit", notice: '家計簿の更新に失敗しました。'
    end
  end

  def destroy
    @budgetbook = Budgetbook.find(params[:id])
    if @budgetbook.user_id != current_user.id
      redirect_to :budgetbooks, notice: "この操作を行うことができません。"
    else
      @budgetbook.destroy
      redirect_to :budgetbooks, notice: '家計簿を削除しました。'
    end
  end

  def budgetbook_params
    params.require(:budgetbook).permit(:year, :month, :household_size, :housing_type, :annual_income, :monthly_income,
    :food_expenses, :housing_expense, :utility_bills, :furniture_cost, :clothing_expenses, :medical_expenses,
    :transportation_expenses, :communication_expenses, :education_cost, :educational_and_entertainment_expenses,
    :entertainment_expenses, :savings, :investments, :others, :user_id)
  end
end
