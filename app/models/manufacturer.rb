class Manufacturer < ActiveRecord::Base
    has_many :book, dependent: :nullify
    
    validates :name, uniqueness: { case_sensitive: false }
    validates :phone, :fax, numericality: true
    validates :name, :address, presence: true
end
