module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      def index
        @posts = current_user.posts
        render json: @posts
      end

      def show
        render json: @post
      end

      def create
        @post = current_user.posts.new(post_params)
        if @post.save
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      def destroy
        PostDeletionJob.perform_in(24.hours, @post.id)
        render json: { message: "Post scheduled for deletion in 24 hours" }
      end

      private

      def set_post
        @post = current_user.posts.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :body, tag_ids: [])
      end
    end
  end
end
