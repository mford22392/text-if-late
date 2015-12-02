class AddPhoneNumberToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :phone_number, :string
  end
end
