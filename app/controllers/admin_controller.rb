class AdminController < ApplicationController
    def index
        if user_signed_in?
            @infomails = InfoMail.all.order(created_at: :desc)
            render :index
        else
            redirect_to new_user_session_path
        end
    end

    def destroy
        infomail = InfoMail.find(params[:id])
        infomail.destroy
        redirect_to action: :index
    end
end