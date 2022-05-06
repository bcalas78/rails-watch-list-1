class ReviewsController < ApplicationController
  before_action :set_review, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @reviews = Review.all
  end

  def new
    @list = List.find(params[:list_id])
    # @reviews = current_user.reviews.new
    @reviews = Review.new
  end

  def create
    @user = current_user(user_params)
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.user = @user
    @review.list = @list

    respond_to do |format|
      if @review.save
        format.html { redirect_to list_path(@list) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "lists/show" }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  def edit
    @list = List.find(@review.list_id)
  end

  def update
    @list = List.find(@review.list_id)
    @review.update(review_params)
    redirect_to list_path(@list)
  end

  def destroy
    @list = List.find(@review.list_id)
    @review.destroy
    redirect_to list_path(@list)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
