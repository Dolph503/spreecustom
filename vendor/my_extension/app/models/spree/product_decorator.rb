module Spree
  module ProductDecorator
    def self.prepended(base)
      base.belongs_to :template, class_name: '::Template', foreign_key: :template_id, optional: true
    end
  end
end

Rails.application.config.to_prepare do
  Spree::Product.prepend Spree::ProductDecorator
end
