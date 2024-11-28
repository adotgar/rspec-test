class Weapon
  attr_reader :type, :damage

  def initialize(type)
    @type=type
    @damage = damage
  end

  DAMAGE_MAP = {
    'sword' => 20,
    'axe' => 18,
    'bow' => 15
  }

  def damage
    DAMAGE_MAP[@type] || 10
  end

end
