module Api
  module V1
    class CommentsController < ApplicationController
      before_action :set_comment, only: [:update, :destroy]

      def create
        post = Post.find(params[:post_id])
        comment = post.comments.new(comment_params.merge(user: current_user))

        if comment.save
          render json: comment, status: :created
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end

      def update
        if @comment.user == current_user
          if @comment.update(comment_params)
            render json: @comment
          else
            render json: @comment.errors, status: :unprocessable_entity
          end
        else
          render json: { error: "Not authorized" }, status: :forbidden
        end
      end

      def destroy
        if @comment.user == current_user
          @comment.destroy
          render json: { message: "Comment deleted" }
        else
          render json: { error: "Not authorized" }, status: :forbidden
        end
      end

      private

      def set_comment
        @comment = Comment.find(params[:id])
      end

      def comment_params
        params.require(:comment).permit(:body)
      end
    end
  end
end
