class ReviewsController < ApplicationController

  def show
    @gunpla = Gunpla.find(params[:gunpla_id])
    @review = Review.find(params[:id])
    render :show
  end

  def create
    @gunpla = Gunpla.find(params[:gunpla_id])
    if review.save
      flash[:notice] = "Review successfully added!"
      redirect_to gunpla_path(@gunpla)
    else
      render :new
    end
  end

  def new
    @gunpla = Gunpla.find(params[:gunpla_id])
    @review = @gunpla.reviews.new
    render :new
  end

  def edit
    @gunpla = Gunpla.find(params[:gunpla_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to gunpla_path(@review.gunpla)
    else
      @gunpla = Gunpla.find(params(:gunpla_id))
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review successfully deleted!"
    redirect_to gunpla_path(@review.gunpla)
  end

  private

    def review_params
      params.require(:review).permit(:title, :content_body, :rating)
    end
end