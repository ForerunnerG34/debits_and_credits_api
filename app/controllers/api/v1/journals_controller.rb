class Api::V1::JournalsController < ApplicationController
    before_action :check_login
    before_action :set_journal, only: %i[show]

    def show
       if @journal
            render json: @journal
        else
            head 404
        end
    end

    def index
        render json: current_user.journals.all
    end

    private

    def set_journal
        @journal = current_user.journals.find_by_id params[:id]
    end
end
