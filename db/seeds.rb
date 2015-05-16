# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

class Seed
  def call
    generate_types
    generate_moves
    generate_pokemon
  end

  def self.call
    new.call
  end


  def generate_pokemon
    40.times do |iteration|
      Pokemon.make_new(Pokegem.get_obj "pokemon", (iteration + 1))
      puts "Created #{Pokemon.all.last} number #{iteration + 1}"
    end
  end

  def generate_types
    18.times do |iteration|
      Type.make_new(Pokegem.get_obj "type", (iteration + 1))
      puts "Created #{Type.all.last} number #{iteration + 1}"
    end
  end

  def generate_moves
    25.times do |iteration|
      Move.make_new(Pokegem.get_obj "move", (iteration + 1))
      puts "Created #{Move.all.last} number #{iteration + 1}"
    end
  end
end

Seed.call
