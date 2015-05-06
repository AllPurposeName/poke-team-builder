class PokemonComparisonDecorator < Draper::Decorator
  attr_reader :team_stats
  decorates :pokemon

  def initialize(*args)
    @team = TeamDecorator.new(current_user.team)
    super(args)
  end

  def compare
    pokemon_attributes = [:hit_points, :attack, :defense, :special_attack, :special_defense, :speed]
    OpenStruct.new(pokemon_attributes.each_with_object(Hash.new(0)) { |attr, hash| hash[attr] = compare_with(attr) })
  end


  def compare_with(attribute)
    team.average(attribute) - self.send(attribute)

    #check self pokemon's attribute against the average of the same attriburte in the team
    #calculate the difference and assign a different glyphicon for the different gaps
    # ex. small green arrow up for +1-20 medium green arrow up for +21-40, big green arrow up for +>41
  end

end
