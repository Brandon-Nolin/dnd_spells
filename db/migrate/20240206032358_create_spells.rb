class CreateSpells < ActiveRecord::Migration[7.1]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.string :duration
      t.string :cast_time
      t.string :range
      t.string :material_cost
      t.boolean :somatic
      t.boolean :verbal
      t.boolean :material
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
