class Book < ActiveRecord::Base
    validates :name, :description, :price, :image_url, :image, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
    attr_accessor :image
    mount_uploader :image, ImageUploader
    #them attr_accessor :image,  mount_uploader :image, ImageUploader
end
