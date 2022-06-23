class OrderSerializer < ActiveModel::Serializer
    has_many :cart_items, dependent: :destroy
    attributes :id, :name, :address, :pay_method, :email
end