class ReviewsController < ApplicationController

  before_action :set_restaurant, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurants_path(@restaurant)
  end
  # def edit
  #   @review = Review.find(params[:id])
  # end

  # def update
  #   @review = Review.find(params[:id])
  #   @review.update(review_params)
  #   redirect_to restaurants_path(@restaurants)
  # end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to review_path, status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
