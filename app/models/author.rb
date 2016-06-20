class Author < ActiveRecord::Base
    has_many :book, dependent: :nullify
    
    validates :name, uniqueness: { case_sensitive: false }
    validates :name, :birthday, :description, :homeland, presence:true
end
