class CreateJoinTableSpellsCharacterClasses < ActiveRecord::Migration[7.1]
  def change
    create_join_table :spells, :character_classes do |t|
      # t.index [:spell_id, :character_class_id]
      # t.index [:character_class_id, :spell_id]
    end
  end
end
