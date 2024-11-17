class RenameMailAddressColumnToInfoMails < ActiveRecord::Migration[7.0]
  def change
    rename_column :info_mails, :MailAddress, :mail_address
  end
end
