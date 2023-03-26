# frozen_string_literal: true

module Api
  module V1
    class BlogsController < ApplicationController
      before_action :set_blog, only: %i[show update destroy]
      before_action :authenticate_user!, except: %i[index show]

      def index
        render json: Blog.all, each_serializer: BlogSerializer, status: :ok
      end

      def show
        render json: @blog, serializer: BlogSerializer, status: :ok
      end

      def create
        blog = current_user.blogs.build(blog_params)
        if blog.save
          render json: blog, status: :created
        else
          render json: blog.errors, status: :unprocessable_entity
        end
      end

      def update
        authorize @blog
        if @blog.update(blog_params)
          render json: @blog, status: :ok
        else
          render json: @blog.errors, status: :unprocessable_entity
        end
      end

      def destroy
        authorize @blog
        @blog.destroy
        head :no_content
      end

      private

      def set_blog
        @blog = Blog.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Blog not found' }, status: :not_found
      end

      def blog_params
        params.require(:blog).permit(:title, :description, :user_id)
      end
    end
  end
end
