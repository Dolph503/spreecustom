module MyExtension
  module Api
    module V1
      class FontsController < ApplicationController
        # You can inherit from ActionController::API if this is a pure API
        # class FontsController < ActionController::API

        def index
          fonts = Font.all
          render json: fonts
        end

        def show
          font = Font.find(params[:id])
          render json: font
        end

        def create
          font = Font.new(font_params)
          if font.save
            render json: font, status: :created
          else
            render json: { errors: font.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def update
          font = Font.find(params[:id])
          if font.update(font_params)
            render json: font
          else
            render json: { errors: font.errors.full_messages }, status: :unprocessable_entity
          end
        end

        def destroy
          font = Font.find(params[:id])
          font.destroy
          head :no_content
        end

        private

        def font_params
          params.require(:font).permit(:name, :style, :file_url)
        end
      end
    end
  end
end