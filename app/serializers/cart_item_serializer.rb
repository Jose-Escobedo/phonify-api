class CartItemSerializer < ActiveModel::Serializer
  belongs_to :phone
  belongs_to :cart
  # belongs_to :order
  attributes :id, :phone_id, :quantity, :cart_id
end
