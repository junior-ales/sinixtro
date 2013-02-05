require 'rspec'
require './lib/sinixtrabinator.rb'

describe 'Sinixtrabinator' do
  it 'display options if no argument is passed' do
    Sinixtrabinator.new('').run.should == File.new(File.join('templates', 'instructions.txt')).read
  end

end
