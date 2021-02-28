class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :vacation_name
    end
  end
end
