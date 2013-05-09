module ApplicationHelper
	def block_off?(block)
		@_block_off = [] if @_block_off.nil?
		@_block_off.include?(block)
	end
	def block_off(block)
		@_block_off = [] if @_block_off.nil?
		block = [block] if block.class == Symbol
		@_block_off = @_block_off + block
	end
	def block_off=(block)
		@_block_off = [] if @_block_off.nil?
		block = [block] if block.class == Symbol
		@_block_off = block
	end
	def money_formater amount
    number_to_currency(amount, :unit => "Rp", :format => '%u %n', :precision => 0 , :delimiter => ".")
  end
	def paginate_options
		{:page => params[:page], :per_page => params[:perpage] || 20}
	end
  def filter_params
    default = {'from' => Time.now.beginning_of_month.to_date.strftime("%-d %B, %Y"), 'to' => Time.now.end_of_month.to_date.strftime("%-d %B, %Y")}

    @filter_params = default.merge((params[:filter] || {}).to_hash ).inject({}){|memo,(k,v)| memo[k.to_sym] = v ; memo}
  end
		
end
