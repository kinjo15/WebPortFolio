class Contact
     include ActiveModel::Model

    attr_accessor :name, :email, :message

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, :presence => { message: "名前を入力してください"}
    validates :email, :presence => { message: "メールアドレスを入力してください"}, format: { with: VALID_EMAIL_REGEX, message: "メールアドレスの形式が不正です"}

end