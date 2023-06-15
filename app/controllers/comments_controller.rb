class CommentsController < ApplicationController
    belongs_to :user
    belongs_to :review
end
