class UsersController < ApplicationController
    skip_before_action :authorize_user, only: [:create, :show, :index]

    # GET "/users"
    def index 
        render json: User.all
    end 

    # GET "/users/:id"
    def show
        current_user = User.find_by(id: session[:current_user])
        render json: current_user
    end 

    # POST "/users"
    def create
        
        user = User.create(user_params)
        if user.valid?
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
          
    end

    # PUT "/users/:id"
    def update
        user = User.find(params[:id])
        user.update!(user_params)
        render json: user, status: :created
    end

    # DELETE "/users/:id"
    def destroy
        user = User.find(params[:id])
        user.destroy
        head :no_content
    end

    private 

    def user_params
        params.permit(:name, :password)
    end 

end
