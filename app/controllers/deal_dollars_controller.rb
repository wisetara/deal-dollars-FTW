class DealDollarsController < ApplicationController
	def index
		d = DealDollar.new
		@lost = d.instance_eval {lost_deals_value}
		@qualified = d.instance_eval {qualified_deals_value}
		@request_for_info = d.instance_eval {request_for_info_deals_value}
		@presentation = d.instance_eval {presentation_deals_value}
		@negotiation = d.instance_eval {negotiation_deals_value}
		@won = d.instance_eval {won_deals_value}
	end
end
