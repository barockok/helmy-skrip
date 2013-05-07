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
	
end
