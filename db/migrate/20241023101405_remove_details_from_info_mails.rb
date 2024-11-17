class RemoveDetailsFromInfoMails < ActiveRecord::Migration[7.0]
  def change
    remove_column :info_mails, :mail_id, :string
  end
end
