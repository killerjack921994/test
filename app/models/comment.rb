class Comment < ActiveRecord::Base
    validates :name, :comment, presence: true
    validates :user, presence: true, length: { maximum: 50 }
end
