class ContactController < ApplicationController
    def index
        @contact = Contact.new
    end

    def confirm  
        @contact = Contact.new(params[:contact].permit(:name, :email, :message))
        #バリデーションに引っかかったとき
        if @contact.invalid?
            render :index
        end  
    end

    def create
        @contact = Contact.new(params[:contact].permit(:name, :email, :message))
        #戻るボタンが押されたら
        if params[:back]
            render :index
        else
            flash[:contact] = @contact
            redirect_to action: :thanks
        end   
    end

    def thanks
        @contact = Contact.new(flash[:contact])
        if @contact.invalid?
            render :thanks
        else
            @infomail = InfoMail.new(sender: @contact.name, mail_address: @contact.email, message: @contact.message, check_flag: 0)
            if @infomail.save
                ContactMailer.sended_email(@contact).deliver
                ContactMailer.received_email(@contact).deliver
            end
        end
    end
end
