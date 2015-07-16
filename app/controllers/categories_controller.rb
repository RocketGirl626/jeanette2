class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Skill Category Created!"
      redirect_to  categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end


  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Skill Category Updated!"
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "Skill Category Destroyed!"
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
