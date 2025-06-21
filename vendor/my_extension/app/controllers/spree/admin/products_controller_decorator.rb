module Spree
  module Admin
    module ProductsControllerDecorator
      def self.prepended(base)
        base.before_action :load_templates, only: [:new, :edit, :create]
      end

      def load_templates
        @templates = Template.all
      end
    end
  end
end

Rails.configuration.to_prepare do
  Spree::Admin::ProductsController.prepend Spree::Admin::ProductsControllerDecorator
end
