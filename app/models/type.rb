class Type < ActiveRecord::Base
  def self.make_new(poke_struct)
    type = self.new()
    type.national_id = poke_struct.national_id
    type.name = poke_struct.name
    type.ineffective = poke_struct.ineffective
    type.no_effect = poke_struct.no_effect
    type.super_effective = poke_struct.super_effective
    type.weakness = poke_struct.weakness
    type.save
  end
end
