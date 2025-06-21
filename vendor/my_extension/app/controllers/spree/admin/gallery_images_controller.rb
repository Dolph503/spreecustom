module Spree
  module Admin
    class GalleryImagesController < Spree::Admin::BaseController
      include ActiveStorage::SetCurrent
      include Rails.application.routes.url_helpers

      def index
        @images = Gallery.all

        render json: @images.map { |img|
          {
            id: img.id,
            name: img.title,
            url: img.image.attached? ? rails_blob_url(img.image, host: request.base_url) : nil
          }
        }
      end
    end
  end
end
