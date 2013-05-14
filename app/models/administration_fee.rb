class AdministrationFee < ActiveRecord::Base
	act_as_date_filter
	act_as_group_by_date
	def self.rickshaw(params)
		q = AdministrationFee
			.filterize(params)
			.group_by_date.sum(:amount)
		res = []
		q.each{|k, v|
			res << {:x => k.to_time(:local).to_js_timestamp, :y => v}
		}
		res.sort_by {|k| k[:x] }
	end	
end
