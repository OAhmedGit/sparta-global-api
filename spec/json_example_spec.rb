require 'spec_helper'

describe 'Testing the exchange rates' do

  before(:all) do
    @exchange_rates = ParseJson.new(HTTParty.get('http://data.fixer.io/api/latest?access_key=9d8a9108b5962ddb85c9840f12ed7f90').body)
  end

  it 'Should be a Hash' do
    expect(@exchange_rates.json_file).to be_kind_of(Hash)
  end

  it "should contain the base as EUR" do
    expect(@exchange_rates.json_file["base"]).to eq "EUR"
  end

  it "Should have a date string" do
    expect(@exchange_rates.json_file["date"]).to be_kind_of(String)
  end


  it "should countain 31 rates" do
    @key_num = 0
    @value_num = 0

    @exchange_rates.json_file["rates"].each do |k,v|
      @key_num += 1
      @value_num += 1
    end

    expect(@key_num).to eq 168
    expect(@value_num).to eq 168
  end

  it "should all rates should be Floats" do
    @exchange_rates.json_file["rates"].each do |k,v|
      expect(v).to be_kind_of(Float).or be_kind_of(Integer)
    end
  end

end
