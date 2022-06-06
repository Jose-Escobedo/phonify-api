class PhoneSerializer < ActiveModel::Serializer
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  attributes :id, :desc, :price, :name, :image, :quantity

end
