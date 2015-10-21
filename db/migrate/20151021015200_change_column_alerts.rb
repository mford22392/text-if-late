class ChangeColumnAlerts < ActiveRecord::Migration
  def change
    change_column(:alerts, :text_time, :time)
  end
end
