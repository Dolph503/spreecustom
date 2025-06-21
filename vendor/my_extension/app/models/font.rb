class Font < ApplicationRecord
  has_one_attached :file  

  validates :name, presence: true
  validates :file, attached: true, content_type: ['font/ttf', 'font/otf', 'application/x-font-ttf', 'application/x-font-opentype']
end
