require "card.rb"
require "rspec"

describe Card do
    subject(:card) { Card.new(2, :s) }
    let(:value) {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king]}
    let(:style) {[:d, :s, :h, :c]}

    describe '#initialize' do
        it 'should have a value instance variable' do
            expect(card.value).to eq(2)
        end

        it 'should have a card class instance variable' do
            expect(card.class).to eq(:s)
        end

        it 'should have a card class that is valid' do 
            expect(value).to include(card.value)
        end

        it 'should have a value that is valid' do 
            expect(style).to include(card.class)
        end
    end
end