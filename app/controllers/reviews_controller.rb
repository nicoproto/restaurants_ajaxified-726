class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) # comes from the route params
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params # comes from the form
    params.require(:review).permit(:content)
  end
end
