class Api::V1::AccountsController < ApplicationController
    before_action :check_login
    before_action :set_account, only: %i[show]

    def show
        if @account
             render json: @account
         else
             head 404
         end
     end
 
     def index
         render json: current_user.accounts.all
     end

    private

    def set_account
        @account = current_user.accounts.find_by_id params[:id]
    end

end
