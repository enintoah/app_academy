require 'tdd.rb'
require 'byebug'

describe '#remove_dups' do 
    let(:arr) {[1, 2, 3, 3, 4]}
    it 'accepts an array' do 
        expect(arr).to be_a(Array) #be_array
    end

    it 'removes duplicates from an array' do 
        expect(arr).to eq([1, 2, 3, 3, 4])
        remove_dups(arr)
        expect(remove_dups(arr)).to eq([1, 2, 3, 4])
    end 
end

describe '#two_sum' do
    let(:arr) {[-1, 0, 2, -2, 1]}
    it 'accepts an array' do 
        expect(arr).to be_a(Array) #be_array
    end

    it 'finds all pairs of positions where the elements at those positions sum to zero' do
        expect(arr).to eq([-1, 0, 2, -2, 1])
        # two_sum(arr)
        expect(two_sum(arr)).to eq([[0, 4], [2, 3]])
    end

    it 'orders pairs to be sorted smaller to bigger' do 
        expect(two_sum(arr)).not_to eq([[2, 3], [0, 4]])
    end
end

describe '#my_transpose' do 
let(:rows) {[
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it 'accepts a 2D array' do 
    expect(rows[0]).to be_a(Array)
    expect(rows[1]).to be_a(Array)
    expect(rows[2]).to be_a(Array)
  end

  it 'converts rows into columns or columns into rows' do
    expect(my_transpose(rows)).to eq (rows.transpose)
  end
end

describe '#stock_picker' do
let(:stocks) {[1, 2, 5, 3, 10, 0.5]}
    it 'accepts an array' do
        expect(stocks).to be_a(Array)
    end

    it 'returns the pair of days that make the most profit' do
        expect(stock_picker(stocks)).to eq([0, 4])
    end

    it 'should return one pair' do 
        expect(stock_picker(stocks).length).to eq(2)
    end
end

describe Game do 
    subject(:towers) { Game.new(4) }
    describe '#initialize' do 
        it 'takes in a number' do 
            expect(towers.size).to eq(4)
        end

        it 'creates three arrays with n discs in the first array and the last two are empty' do 
            expect(towers.a).to be_a(Array)
            expect(towers.b).to be_a(Array)
            expect(towers.c).to be_a(Array)
            expect(towers.answer).to be_a(Array)
            expect(towers.a.length).to eq(4)
            expect(towers.b.length).to eq(0)
            expect(towers.c.length).to eq(0)
            expect(towers.answer.length).to eq(4)
        end

        it 'should have the first array be an array of numbers' do
            expect(towers.a).to eq([1, 2, 3, 4])
        end
    end

    describe '#move' do 
    let(:c) {[2]}
    let(:d) {[1]}
        it 'should only move the smallest number' do
            towers.move(towers.a, towers.b)
            expect(towers.a).to eq([2, 3, 4])
            expect(towers.b).to eq([1])
        end

        it 'should not put the number in an array that has a larger number before it' do 
            expect{towers.move(c, d)}.to raise_error("not valid move")
        end
    end

    describe 'won?' do 
        let(:b) {[1, 2, 3, 4]}
        it 'checks if 2nd or 3rd array is equal to answer' do
            expect(b == towers.answer || c == towers.answer).to eq(true) 
        end
    end

end
