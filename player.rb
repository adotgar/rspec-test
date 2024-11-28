require './weapon'

class Player
  attr_reader :hitpoints, :weapon
  attr_writer :hitpoints
  def initialize
    @hitpoints = 100
    @weapon = nil
  end

  def weapon?
    @weapon != nil
  end

  def grab_weapon(weapon)
    @weapon = weapon
  end

  def attack(target_player)
    damage = @weapon.nil? ? 5 : weapon.damage
    target_player.hitpoints -= damage
  end
end
