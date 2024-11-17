class RemoveDetailFromInfoMails < ActiveRecord::Migration[7.0]
  def change
    remove_column :info_mails, :received_date_and_time, :string
  end
end
