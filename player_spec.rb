# player_spec.rb
require './player'
require './weapon'

describe Player do
  let(:new_player) { Player.new }

  context "when the player just spawned" do

    it 'has 100 points' do
      expect(new_player.hitpoints).to eq(100)
    end

    it 'has no weapon' do
      expect(new_player.weapon?).to be(false)
    end
  end

  context "when the player picks up a weapon" do
    let(:weapon) { Weapon.new(type="sword") }
    before do 
      new_player.grab_weapon(weapon)
    end  

    it 'has a weapon' do
      expect(new_player.weapon?).to be (true)
    end

    it 'has the correct weapon' do
      expect(new_player.weapon.type).to eq(weapon.type)
    end
  end

  context "when the player attacks an opponent" do
    let(:enemy_player) { Player.new }
    let(:max_health) { 100 }
    let(:sword) { Weapon.new(type="sword") }

    it 'deals 5 damage with their fist' do
      new_player.attack(enemy_player)
      expect(enemy_player.hitpoints).to eq(max_health - 5)
    end

    context 'when the player is wielding a sword' do
      it 'deals 20 damage with the sword' do
        new_player.grab_weapon(sword)
        new_player.attack(enemy_player)
        expect(enemy_player.hitpoints).to eq(max_health - 20)
      end
    end
  end

end
