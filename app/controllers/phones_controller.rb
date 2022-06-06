class PhonesController < ApplicationController
    # skip_before_action :authorize_user, only: [:index]
    def index
        phones = Phone.all
        render json: phones, status: :ok
    end

    def show
        phone = Phone.find(params[:id])
        render json: phone, status: :ok
    end
end
