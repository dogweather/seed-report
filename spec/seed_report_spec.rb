require 'spec_helper'

describe SeedReport do
  it 'has a version number' do
    expect( SeedReport::VERSION ).not_to be nil
  end

  it 'has a #for_model method' do
    expect( SeedReport ).to respond_to(:for_model)
  end
end
