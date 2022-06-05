class Cart < ApplicationRecord
    has_many :cart_items, dependent: :destroy
    has_many :phones, through: :cart_items

end
