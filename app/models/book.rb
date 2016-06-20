class Book < ActiveRecord::Base
    belongs_to :staff
    belongs_to :author
    belongs_to :manufacturer
    has_and_belongs_to_many :category
    
    validates :name, uniqueness: { case_sensitive: false }
    validates :name, :description, :price, :image_url, :image, presence: true
    validates :image_url, allow_blank: true, format: {
        with: %r{\.(gif|jpg|png)\Z}i,
        message: 'must be a URL for GIF, JPG or PNG image.'
        }
    attr_accessor :image
    mount_uploader :image, ImageUploader
    #them attr_accessor :image,  mount_uploader :image, ImageUploader
end
