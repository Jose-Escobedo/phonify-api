class CartItem < ApplicationRecord
    belongs_to :phone
    belongs_to :cart
    # belongs_to :order
    
    def total_price
        self.quantity * self.phone.price
    end
end
