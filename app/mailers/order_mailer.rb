class OrderMailer < ApplicationMailer
    layout 'mailer'
    
    def order_mail (current_order)
        @current_order = current_order
        @product_info = []
        @current_order.cart_items.map do |item|
            @product_info << "#{item.phone.name}:"" Quantity, ""#{item.quantity}"
        end 
        attachments['logo.svg'] = File.read('app/assets/images/logo.svg')
        mail(
            from: "Phonify <jose@escobedojose.dev>",
            to: current_order.email,
            subject: "Order Confirmation"
        )
    end
end
