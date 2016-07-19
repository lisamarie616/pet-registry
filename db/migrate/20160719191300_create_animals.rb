class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :animal_type
      t.string :sex
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
