class Gallery < ApplicationRecord
  has_one_attached :image

  validate :acceptable_image_type

  private

  def acceptable_image_type
    return unless image.attached?

    unless image.content_type.in?(%w[image/png image/jpg image/jpeg image/webp])
      errors.add(:image, "must be a PNG, JPG, or WEBP file")
    end
  end
end
