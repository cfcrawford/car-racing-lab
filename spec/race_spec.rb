require 'spec_helper'

RSpec.describe Race do

  let(:race) { Race.new }

  describe '::new' do
    it 'instantiates two cars' do
      expect(race.cars.count).to eq(2)
    end

    it 'accelerates the cars to random speeds' do
      expect(race.cars.first.speed).not_to  eq(race.cars.last.speed)
    end
  end

  describe '#winner' do
    it 'returns the winner' do
      first_car = race.cars.first
      last_car = race.cars.last
      winner = first_car.speed > last_car.speed ? first_car.speed : last_car.speed
      expect(race.winner.speed).to eq(winner)
    end
    it 'is not the loser' do
      first_car = race.cars.first
      last_car = race.cars.last
      winner = first_car.speed > last_car.speed ? first_car.speed : last_car.speed
      loser = first_car.speed < last_car.speed ? first_car.speed : last_car.speed
      expect(winner).not_to be(loser)
    end
  end

  describe '#loser' do
    it 'returns the loser' do
      first_car = race.cars.first
      last_car = race.cars.last
       loser = first_car.speed < last_car.speed ? first_car.speed : last_car.speed
      expect(race.loser.speed).to eq(loser)
    end
    it 'is not the winner' do
      first_car = race.cars.first
      last_car = race.cars.last
      winner = first_car.speed > last_car.speed ? first_car.speed : last_car.speed
      loser = first_car.speed < last_car.speed ? first_car.speed : last_car.speed
      expect(loser).not_to be(winner)
    end
  end
end
