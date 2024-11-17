class AddMailAddressToInfoMails < ActiveRecord::Migration[7.0]
  def change
    add_column :info_mails, :MailAddress, :string
  end
end
