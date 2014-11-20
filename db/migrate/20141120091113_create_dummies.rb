class CreateDummies < ActiveRecord::Migration
  def change
    create_table :dummies do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end
  end
end
