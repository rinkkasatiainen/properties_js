require 'spec_helper'

class CoinChanger
  COINS = [200, 100, 50, 20, 10]
  def change(amount)
    coins = []
    COINS.each do |coin|
      while( amount >= coin)
        coins << coin
        amount -= coin
      end
    end

    return coins
  end
end

module CoinGenerator
  def coin_generator
    range(10,600) / 10 * 10
  end
  def a_random_coin
    Rantly{ coin_generator }
  end
end

describe 'CoinChanger' do
  class Rantly
    include CoinGenerator
  end

  subject { CoinChanger.new }
  EXPECTED_COINS = [10, 20, 50, 100, 200].to_set.freeze

  it 'should return amount of coins' do
    property_of { coin_generator }.check do | amount |
      coins = subject.change(amount.freeze)
      coin_amount = coins.inject(0) {| coin , carry | coin + carry }
      expect(coin_amount).to be amount
    end
  end

  it 'should return consist only of given coins' do
    property_of { coin_generator }.check do | amount |
      coins = subject.change(amount)
      coins_as_set = coins.to_set
      coins_not_part_of_expected = coins_as_set - EXPECTED_COINS

      expect(coins_not_part_of_expected).to be_empty
    end
  end

  it 'any coin' do
    expected_coins = [10, 20, 50, 100, 200].to_set
    property_of { coin_generator }.check do | amount |
      coins = subject.change(amount)
      expected_coins.each do |coin|
        expect( coins.select {|c| c === coin}.size ).to be <= 2;
      end
    end
  end

end