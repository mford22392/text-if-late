class CreateAlerts < ActiveRecord::Migration
  def change

    create_table "alerts" do |t|
      t.string :origin
      t.string :destination
      t.datetime :text_time
    end

  end
end
