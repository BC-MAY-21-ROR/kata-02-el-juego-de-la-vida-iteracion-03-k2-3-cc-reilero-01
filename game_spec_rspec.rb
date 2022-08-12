# frozen_string_literal: true

require 'rspec'
require_relative './game'

describe Cell do
  describe '.print' do
    it 'should print the board' do
      expect(Cell.print).to eq('Fizz')
    end
  end

  describe '.game' do
    it 'should print the game' do
      expect(Cell.game).to eq('Buzz')
    end
  end
end
