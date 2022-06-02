class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    include ActionController::Cookies
    # before_action :current_user
    before_action :authorize_user
#     skip_before_action :authorize_user, only: [:validate_phone_id, :validate_cart_id ]

#     def validate_phone_id
#         params.require(:phone_id)
#         phone_id = params[:phone_id].to_i # prevents SQL injection
#         unless Phone.exists?(phone_id)
#           raise ArgumentError, 'Product not found. The product might'\
#            ' not exist or has been deleted.'
#         end
#     end

#   # Ensures that the cart_id parameter exists in the request
#   # and that the cart_id exists in the Cart table
#     def validate_cart_id
#         params.require(:cart_id)
#         cart_id = params[:cart_id].to_i # prevents SQL injection
#         raise ArgumentError, 'Cart not found.' unless Cart.exists?(cart_id)
#     end
   
    def current_user
        User.find_by(id: session[:current_user])
    end


    def authorize_user
        @current_user = User.find_by(id: session[:current_user])

        render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
    end

    def is_admin
        return render json: { error: "Not Authorized" }, status: :unauthorized unless current_user.admin
    end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end