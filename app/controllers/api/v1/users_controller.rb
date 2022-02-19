class Api::V1::UsersController < ApplicationController
    # GET/usres/1
    def show
        render json: User.find(params[:id])
    end
end
