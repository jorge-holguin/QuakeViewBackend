module Api
    class CommentsController < ApplicationController
      def create
        feature = Feature.find(params[:feature_id])
        comment = feature.comments.create(comment_params)
        if comment.persisted?
          render json: comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end
  
      private
  
      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
  