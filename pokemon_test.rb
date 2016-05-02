require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'pokemon'
require 'pry'

class PokemonTest < Minitest::Test

  def test_it_exists

    pikachu = Pokemon.new('pikachu')

    assert_equal Pokemon, pikachu.class
  end

  def test_we_can_get_name

    pikachu = Pokemon.new('pikachu')
    assert_equal 'pikachu', pikachu.name
  end

  def test_we_can_try_to_do_an_attack
    pikachu = Pokemon.new('pikachu')
    assert_equal "pikachu doesn't know the move Thunder maybe you should teach it to him/her", pikachu.do_this_attack("Thunder")
  end

  def test_pokemone_starts_with_empty_hash_and_hash_can_store_keys_and_values_and_do_this_attack_returns_correct_response
    pikachu = Pokemon.new('pikachu')
    assert_equal ({}), pikachu.attacks

    pikachu.learn_this_attack('thunder', 100)
    assert_equal ({'thunder' => 100}), pikachu.attacks

    assert_equal "pikachu used thunder! did 100 damage!", pikachu.do_this_attack('thunder')
  end

  def test_what_do_you_know
    pikachu = Pokemon.new('pikachu')
    pikachu.learn_this_attack('fire blast', 100)
    pikachu.learn_this_attack('slash', 30)
    assert_equal ({'fire blast' => 100, 'slash' => 30}), pikachu.what_do_you_know
  end

  def test_its_super_effective
    pikachu = Pokemon.new('pikachu')
    pikachu.learn_this_attack('fire blast', 100)
    pikachu.learn_this_attack('slash', 30)
    pikachu.its_super_effective
    assert_equal ({'fire blast' => 200, 'slash' => 60}), pikachu.what_do_you_know
  end

  def test_check_attack
    pikachu = Pokemon.new('pikachu')
    pikachu.learn_this_attack('fire blast', 100)
    pikachu.learn_this_attack('slash', 30)
    assert_equal 30, pikachu.check_attack('slash')
    pikachu.its_super_effective
    assert_equal 60, pikachu.check_attack('slash')
  end

  def test_how_many_moves
    pikachu = Pokemon.new('pikachu')
    assert_equal 0, pikachu.how_many_moves
    pikachu.learn_this_attack('fire blast', 100)
    pikachu.learn_this_attack('slash', 30)
    assert_equal 2, pikachu.how_many_moves
    pikachu.learn_this_attack('earthquake', 100)
    assert_equal 3, pikachu.how_many_moves
  end

  def test_strongest_attack
    

  end



end
