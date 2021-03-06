require 'pry'
class Pokemon
  attr_reader :name, :attacks

  def initialize(name)
    @name   = name
    @attacks = {}
  end

  def do_this_attack(attack)
    if @attacks.has_key?(attack)
      "#{name} used #{attack}! did #{@attacks[attack]} damage!"
    else
    "#{name} doesn't know the move #{attack} maybe you should teach it to him/her"
    end
  end

  def learn_this_attack(attack, points)
    @attacks.store(attack, points)
  end

  def what_do_you_know
    @attacks
  end

  def its_super_effective
    @attacks = @attacks.each { |k, v| @attacks[k] = v * 2 }
  end

  def check_attack(attack)
    @attacks[attack]
  end

  def how_many_moves
    @attacks.size
  end
end
