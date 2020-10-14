class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_is_admin_and_editor

  def index
    @categories = Category.all 
    @category   = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      redirect_to categories_url
      flash.notice = "Category has been created!"
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params['id']) 
  end

  def update
    @category = Category.find(params['id'])
    if @category.update(category_params)
       redirect_to categories_url
       flash.notice = "Category has been updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params['id'])
    @category.destroy 
    flash.alert = "Category has been deleted!"
    redirect_to categories_path
  end

  private 
  def category_params
    params.require(:category).permit(:category)
  end
  
end
