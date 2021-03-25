require 'rails_helper'

describe Dog, type: :model do
  it 'creates a dog instance' do
    dog = Dog.new(
      name: 'Luke',
      age: 3,
      breed: 'Vizla')
      expect(dog.name).to eq('Luke')
  end
end
