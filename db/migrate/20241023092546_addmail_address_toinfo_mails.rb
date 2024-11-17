class AddmailAddressToinfoMails < ActiveRecord::Migration[7.0]
  def change
    add_column :info_mails, :mail_address, :string
  end
end
