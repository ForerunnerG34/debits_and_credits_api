class Api::V1::AccountsController < ApplicationController
    before_action :check_login
    before_action :set_account, only: %i[show update]

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

    def create
        account = current_user.accounts.build(account_params)
        account.order = current_user.accounts.count + 1 unless account.order.present?

        if account.save
            render json:account, status: :created
        else
            account json: account.errors, status: :unprocessable_entity    
        end
    end

    def update
        if @account.update(account_params)
          render json: @account
        else
          render json: @account.errors, status: :unprocessable_entity
        end
      end

    private

    def account_params
        params.require(:account).permit(:name, :is_debit)
              .with_defaults(is_debit: true)
    end

    def set_account
        @account = current_user.accounts.find_by_id params[:id]
    end
end
