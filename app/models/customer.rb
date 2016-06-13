class Customer < ActiveRecord::Base
    validates :phone, numericality: true
end
