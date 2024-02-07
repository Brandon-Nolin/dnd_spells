require 'csv'

# Delete all records.
Spell.delete_all
CharacterClass.delete_all
School.delete_all

# Fetch the file name.
filename = Rails.root.join('db/dnd-spells.csv')

puts "Loading spells from CSV file: #{filename}"

csv_data = File.read(filename)
spells = CSV.parse(csv_data, headers: true, encoding: "utf-8")

spells.each do |spell_data|
  # Find or create the School if it does not yet exist
  school = School.find_or_create_by(name: spell_data["school"])

  # Create the spell
  spell = school.spells.create(
    name: spell_data["name"],
    description: spell_data["description"],
    level: spell_data["level"].to_i,
    duration: spell_data["duration"],
    cast_time: spell_data["cast_time"],
    range: spell_data["range"],
    somatic: spell_data["somatic"],
    verbal: spell_data["verbal"],
    material: spell_data["material"],
    material_cost: spell_data["material_cost"]
  )

  # Turn the classes string value from the csv into an array
  classes = spell_data["classes"].split(/\s*,\s*/)

  # For every class, create or find the CharacterClass record and associate the class with the spell.
  classes.each do |c|
    current_class = CharacterClass.find_or_create_by(name: c)

    spell.character_classes << current_class
  end

  spell.save
end

puts "Database seeding complete!"
puts "Created #{Spell.count} spells."
puts "Created #{CharacterClass.count} character classes."
puts "Created #{School.count} schools of magic."