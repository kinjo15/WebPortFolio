class ContactMailer < ApplicationMailer
    
    def received_email(contact)
        @contact = contact
        mail(
            to: ENV['SEND_MAIL'],
            subject: '【REIASONE】お問い合わせを承りました'
            )
    end

    def sended_email(contact)
        @contact = contact
        mail(
            to: contact.email,
            subject: '【REIASONE】お問合せ内容のご確認'
          )
    end
end
