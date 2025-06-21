class Template < ApplicationRecord
  validates :data, presence: true

  has_many :products, class_name: 'Spree::Product', foreign_key: :template_id
end
