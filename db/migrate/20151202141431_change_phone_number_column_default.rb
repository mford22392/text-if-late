class ChangePhoneNumberColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:alerts, :phone_number, '0000000000')
  end
end
