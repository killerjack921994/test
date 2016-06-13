class Manufacturer < ActiveRecord::Base
    validates :phone, :fax, numericality: true
end
