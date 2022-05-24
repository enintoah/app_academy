require 'deck.rb'
require 'rspec'

describe Deck do 
    subject(:deck) {Deck.new}
    describe "#initialize" do
        it "should create a deck that is an array with 52 cards" do
            expect(deck.deck).to be_a(Array)
            expect(deck.deck.length).to eq (52)
        end

    end
    describe '#shuffle_deck' do 
    let(:arr) {[1, 2, 3, 4, 5]}
    let(:ogarr) {[1, 2, 3, 4, 5]}
        it "should shuffle deck" do
            deck.shuffle_deck(arr)
            expect(arr).not_to eq(ogarr)
            expect(arr.sort).to eq(ogarr)
        end
    end
end