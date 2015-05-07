class PokemonComparisonDecorator < Draper::Decorator
  decorates :pokemon
  attr_reader :team_stats, :team, :evaluation

  def compare_team(current_user_team)
    @team = TeamDecorator.new(current_user_team)
    @evaluation = {}
  end

  def div
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = stat_difference(attr) })
  end

  def compare
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = compare_with(attr) })
  end


  def compare_with(attribute)
    @evaluation[attribute] = self.object.send(attribute) - team.average(attribute)
  end

  def stat_difference(attribute)
    stat_diff = @evaluation[attribute] ||= compare_with(attribute)

    if stat_diff > 20
      "big_green"
    elsif stat_diff > 0
      "small_green"
    elsif stat_diff < 20
      "big_red"
    elsif stat_diff < 0
      "small_red"
    end
    #check self pokemon's attribute against the average of the same attriburte in the team
    #calculate the difference and assign a different glyphicon for the different gaps
    # ex. small green arrow up for +1-20 medium green arrow up for +21-40, big green arrow up for +>41
  end

  def id
    object.id
  end

  def image
    object.sprites.first.image
  end

  def name
    object.name
  end

  def attack
    object.attack
  end

  def defense
    object.defense
  end

  def special_defense
    object.special_defense
  end

  def special_attack
    object.special_attack
  end

  def speed
    object.speed
  end

  def hit_points
    object.hit_points
  end
end
