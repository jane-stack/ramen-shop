class CommentsController < ApplicationController
    before_action :find_review
    before_action :authorize, only: [:create]

    def index
        @review = Review.find(params[:review_id])
        @comment = @review.comments
        render json: @comment
    end

    def create
        @comment = @review.comments.create(comment_params)
        @comment.user = current_user
        if @comment.save
            render json: @comment, status: 201
        else
            render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = @review.comments.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    private
    
    def comment_params
        params.premit(:body)
    end

    def find_blog
        @review = Review.find(params[:review_id])
    end

end
