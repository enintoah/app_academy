require "hand.rb"
require "rspec"

describe Hand do 
    subject(:hand) { Hand.new }
    describe "initialize" do 
        it 'should create an empty array for 5 cards' do
            expect(hand.cards.length).to eq(0)
            expect(hand.cards).to be_a(Array)
        end
    end
end