class Category < ActiveRecord::Base
    has_and_belongs_to_many :book
    
    validates :name, uniqueness: { case_sensitive: false }
    validates :name, :description , presence: true
end
