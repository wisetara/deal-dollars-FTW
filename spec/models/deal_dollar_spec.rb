require 'rails_helper'

KEY = 'G5mZccexXgchNkAYOBlQ' # Development && Test Key

# In real life, I'd probably stub out external API calls, but let's imagine
# that the PipelineDeals API never goes down.

RSpec.describe DealDollar, :type => :model do
	it "accesses the PipelineDeals API" do
		@uri = URI("https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{KEY}")
		response = Net::HTTP.get(@uri)
		expect(response).to be_an_instance_of(String)
	end

	it "returns JSON data with valid api credentials" do
		deals = RestClient.get "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{KEY}"
	  response_json = JSON.parse(deals)
	  expect(response_json).to be_an_instance_of(Hash)
	  expect(response_json['entries'].first['people']).to be_an_instance_of(Array)
	  expect(response_json['entries'].size).to eq 100
	  expect(response_json['entries'].size).not_to eq 42
	end
end