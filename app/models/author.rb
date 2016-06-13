class Author < ActiveRecord::Base
    validates :name, :birthday, :description, :homeland, presence:true
end
