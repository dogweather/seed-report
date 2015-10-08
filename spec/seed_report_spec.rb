require 'spec_helper'

describe SeedReport do
  it 'has a version number' do
    expect( SeedReport::VERSION ).not_to be nil
  end

  it 'has a #report_growth method' do
    expect( SeedReport ).to respond_to(:report_growth)
  end
end
