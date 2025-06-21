module Spree
  module LineItemDecorator
    extend ActiveSupport::Concern

    included do
      has_one_attached :design_image
    end
  end
end

Rails.application.config.to_prepare do
  Spree::LineItem.include Spree::LineItemDecorator
end
