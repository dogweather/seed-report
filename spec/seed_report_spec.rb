require 'spec_helper'

class MockModel
  attr_accessor :count, :name
end


describe SeedReport do
  before(:each) do
    @apple_model = MockModel.new
    @apple_model.count = 5
    @apple_model.name = 'Apple'
  end


  it 'has a version number' do
    expect( SeedReport::VERSION ).not_to be nil
  end

  it 'has a #for_model method' do
    expect( SeedReport ).to respond_to(:for_model)
  end

  it 'outputs the original count' do
    expect {
      SeedReport.for_model @apple_model do
        @apple_model.count = 11  # Simulate creating instances
      end
    }.to output(/5/).to_stdout
  end

  it 'outputs the increase' do
    expect {
      SeedReport.for_model @apple_model do
        @apple_model.count = 11  # Simulate creating instances
      end
    }.to output(/6/).to_stdout
  end

  it 'outputs the model name' do
    expect {
      SeedReport.for_model @apple_model do
        @apple_model.count = 11  # Simulate creating instances
      end
    }.to output(/Apple/).to_stdout
  end
end
