class Cart < ApplicationRecord
    has_many :cart_items
    has_many :phones, through: :cart_items

    def sub_total
        sum = 0
        self.line_items.each do |line_item|
          sum+= line_item.total_price
        end
        return sum
    end
end
