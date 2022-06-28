class OrderSerializer < ActiveModel::Serializer
    has_many :phones, dependent: :destroy
    attributes :id, :name, :address, :pay_method, :email, :delivery_instructions, :total
end