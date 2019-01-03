class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def edit
    @food = Food.find(params[:id])
  end

  def create
    @food = Food.new(food_params)
      if @food.save
        redirect_to food_path(@food)
      end
  end

  def update
    @food = Food.find(params[:id])
    @food.update(food_params)
    redirect_to food_path(@food)
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

    def food_params
      params.require(:food).permit(:name,:calories,:user_id)
    end

end
