class ReviewsController < ApplicationController
    before_action :find_review, only: [:update, :destroy]
    before_action :unprocessable_entity_if_not_found, only: [:update, :destroy]
    skip_before_action :authorize, only: [:index]
    before_action only: [:update, :destroy] do
        authorize_user_resource(@review.user_id)
    end

    def index
        if params[:user_id]
            user = User.find_by_id(params[:user_id])
            @reviews = user.reviews
        else
            @reviews = Review.all
        end
        render json: @reviews
    end

    def create
        review = current_user.reviews.create(review_params)
        if review.valid?
            render json: review
        else
            render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        @review.update(review_params)
        render json: @review
    end

    def destroy
        @review.destroy
        render json: @review
    end

    private

    def review_params
        params.premit(:content)
    end

    def find_review
        @review = Review.find_by_id(params[:id])
    end

    def unprocessable_entity_if_not_found
        render json: { message: "Review not found" }, status: :unprocessable_entity unless @review
    end

end
