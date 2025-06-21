module Spree
  module Admin
    class FontController < Spree::Admin::BaseController
      include ActiveStorage::SetCurrent
      include Rails.application.routes.url_helpers

      def index
        @allFonts = Font.all

        render json: @allFonts.map { |font|
          {
            id: font.id,
            name: font.name,
            url: font.file.attached? ? rails_blob_url(font.file, host: request.base_url) : nil
          }
        }
      end
    end
  end
end
