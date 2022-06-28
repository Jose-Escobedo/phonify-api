class Cart < ApplicationRecord
    has_many :cart_items
    has_many :phones, through: :cart_items

end
