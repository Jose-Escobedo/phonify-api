class CartItem < ApplicationRecord
    belongs_to :phone
    belongs_to :cart
    belongs_to :order
end
