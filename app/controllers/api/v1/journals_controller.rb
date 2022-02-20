class Api::V1::JournalsController < ApplicationController
    before_action :set_journal, only: %i[show destroy]
    before_action :check_owner, only: %i[show destroy]

    def show
        render json: Journal.find(params[:id])
    end

    private

    def set_journal
        @journal = Journal.find(params[:id])
    end

    def check_owner
        head :forbidden unless @journal.user_id == current_user&.id
    end
end
