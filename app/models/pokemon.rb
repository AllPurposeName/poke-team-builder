class Pokemon < ActiveRecord::Base
  has_many :pokemon_moves
  has_many :moves, through: :pokemon_moves, inverse_of: :pokemon
  has_many :sprites

  def self.make_new(poke_struct)
    pokemon = self.new()
    pokemon.national_id = poke_struct.national_id
    pokemon.special_attack = poke_struct.sp_atk
    pokemon.special_defense = poke_struct.sp_def
    pokemon.attack = poke_struct.attack
    pokemon.defense = poke_struct.defense
    pokemon.speed = poke_struct.speed
    pokemon.hit_points = poke_struct.hp
    pokemon.name = poke_struct.name
    pokemon.save
    pokemon.set_image(poke_struct)
    pokemon
  end

  def set_image(poke_struct)
    poke_struct.sprites.each do |sprite|
      self.sprites.make_new(Pokegem.get_obj "sprite", poke_struct.sprites.last["resource_uri"].split("/").last)
    end
  end

  def set_moves(poke_struct)
    poke_struct.moves.each do |move|
      self.moves << Move.find_by(name: (Pokegem.get "move", move["name"]))
    end
  end
end
