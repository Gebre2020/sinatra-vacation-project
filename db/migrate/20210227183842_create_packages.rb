class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :package_name
      t.integer :budget
      t.integer :user_id
      t.integer :vacation_id
    end
  end
end
