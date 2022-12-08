class ExpensesController < ApplicationController

  def index 
  end 

  def show 
  end 
  
  def create 
    @expense = Expense.expense_calculation(expense_params)
    render json: @expense, status: :ok
  end 

  private 

    def expense
      @expense ||= Expense.fins(params[:id])
    end 

    def expense_params 
      params.require(:expense).permit(:name, :amount, :group_id, :category_id, expense_payers: [:id, :amount]).with_defaults(created_by_id: current_user.id)
    end 
end
