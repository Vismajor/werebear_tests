require 'minitest/autorun'
require 'minitest/rg'

require_relative '../werebear.rb'

class WereBearTest < Minitest::Test

  def setup
    @name = 'Barnaby Bearington'
    @werebear = WereBear.new(@name)
  end

  def test_can_create_werebear
    assert_equal(@werebear.name, @name)
  end

  def test_have_clothes
    assert_equal(@werebear.clothes.count, 0)
  end

  def test_can_add_clothes
    @werebear.add_clothes('Monocle', 'Top hat', 'Walking stick', 'Waistcoat')
    assert_equal(@werebear.clothes.length, 4)
  end

  def test_check_outfit__naked
    assert_equal(@werebear.check_outfit, 'Barnaby Bearington is naked! Oh noes!')
  end

  def test_check_outfit__one_item
    @werebear.add_clothes('monocle')
    assert_equal(@werebear.check_outfit, 'Barnaby Bearington is currently wearing a monocle')
  end

  def test_check_outfit__two_items
    @werebear.add_clothes('monocle', 'top hat')
    assert_equal(@werebear.check_outfit(), 'Barnaby Bearington is currently wearing a monocle and a top hat')
  end

  def test_check_outfit__three_items
    @werebear.add_clothes('monocle', 'top hat', 'waistcoat')
    assert_equal(@werebear.check_outfit, 'Barnaby Bearington is currently wearing a monocle, a top hat and a waistcoat')
  end

  def  test_belly_empty?
    assert_equal(@werebear.belly.length, 0)
  end

  def test_is_intolerant?
    assert_equal(@werebear.intolerant?("milk and cookies"), true)
  end

  def test_doesnt_eat_intolerant_foods
    mac_n_cheese = "mac n cheese"
    @werebear.eat(mac_n_cheese)
    assert_equal(@werebear.belly.length, 0)
  end

  def test_add_food_to_belly
    salmon = "salmon canape"
    @werebear.eat(salmon)
    assert_equal(@werebear.belly, [salmon])
  end







end