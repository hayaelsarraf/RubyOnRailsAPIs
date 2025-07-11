module Api
  module V1
    class TagsController < ApplicationController
      def index
        render json: Tag.all
      end

      def create
        tag = Tag.new(tag_params)
        if tag.save
          render json: tag, status: :created
        else
          render json: tag.errors, status: :unprocessable_entity
        end
      end

      private

      def tag_params
        params.require(:tag).permit(:name)
      end
    end
  end
end
