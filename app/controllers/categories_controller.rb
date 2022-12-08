class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :category, only: [:show, :update, :destroy]

  def index 
    @category = Category.all
    render json: @category, status: :ok
  end 

  def show 
    render json: {category: }, status: :ok
  end 

  def create 
    @category = Category.create!(category_params)
    render json: @category, status: :ok
  end 

  def update
    @category = category.update!(category_params)
    render json: @category, status: :ok
  end 

  def destroy
    @category = category.destroy!
    render json: @category, status: :ok
  end 

  private 

    def category 
      @category ||= Category.find(params[:id])
    end 

    def category_params 
      params.require(:category).permit(:name)
    end
end
