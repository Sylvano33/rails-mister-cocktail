class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create

     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose = Dose.new(dose_params)
     @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
     render :new
    end
  end

  def destroy
  end


  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end


end

#  @restaurant = Restaurant.find(params[:restaurant_id])
#   @review = Review.new
# end

# def create
#   @review = Review.new(review_params)
#   # we need `restaurant_id` to asssociate review with corresponding restaurant
#   @review.restaurant = Restaurant.find(params[:restaurant_id])
#   @review.save
# end