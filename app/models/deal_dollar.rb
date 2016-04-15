require 'active_support'
require 'rest-client'
require 'json'

class DealDollar
	KEY = 'G5mZccexXgchNkAYOBlQ' # Development && Test Key

	def initialize
		deals = RestClient.get "https://api.pipelinedeals.com/api/v3/deals.json?api_key=#{KEY}"
	  @json = JSON.parse(deals)
	end

	def lost_deals_value
		lost_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 0 }
		lost_deals_values = lost_deals.map { |deal| deal['value'].to_f }
		total_lost_deals_value = lost_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end

	def qualified_deals_value
		qualified_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 10 }
		qualified_deals_values = qualified_deals.map { |deal| deal['value'].to_f }
		total_qualified_deals_value = qualified_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end

	def request_for_info_deals_value
		request_for_info_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 25 }
		request_for_info_deals_values = request_for_info_deals.map { |deal| deal['value'].to_f }
		total_request_for_info_deals_value = request_for_info_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end

	def presentation_deals_value
		presentation_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 50 }
		presentation_deals_values = presentation_deals.map { |deal| deal['value'].to_f }
		total_presentation_deals_value = presentation_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end

	def negotiation_deals_value
		negotiation_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 75 }
		negotiation_deals_values = negotiation_deals.map { |deal| deal['value'].to_f }
		total_negotiation_deals_value = negotiation_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end

	def won_deals_value
		won_deals = @json['entries'].select { |deal| deal['deal_stage']['percent'].to_i == 100 }
		won_deals_values = won_deals.map { |deal| deal['value'].to_f }
		total_won_deals_value = won_deals_values.inject(0){ |sum,x| sum + x }.round(2)
	end
end