# == Schema Information
#
# Table name: layers
#
#  id           :integer(4)      not null, primary key
#  koma_id      :integer(4)
#  picture_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#  margin_left  :integer(4)
#  margin_right :integer(4)
#  margin_up    :integer(4)
#  margin_down  :integer(4)
#  stack_number :integer(4)      default(0)
#

class Layer < ActiveRecord::Base
	belongs_to :picture, :class_name => "Picture"
	belongs_to :koma, :class_name => "Koma"
	
	# Creates a new layer and puts in a stack number. The following diagram shows how it works
	# Top: 2^31
	#
	# (3) * 2^29 <- entry 6 (the speech bubble in front of everything)
	#
	# 2^30 <- entry 2 (character's clothe accessory layer)
	#
	# 2^29 <- entry 3 (character's clothe layer)
	#
	# Mid: 0 <- entry 1 (character layer)
	#
	#
	#
	# -2^30 <- entry 4 (the chair the character is sitting on)
	#
	# (-3) * 2^29 <- entry 5 (the desk behind the chair)
	#
	# Bot: -2^31
	# This schemes allows for very rapid insertion of new layers anywhere for an initial minimum of
	# 31 times before we have to reshuffle everything. In addition, it allows easy storage and 
	# ordered retrieval so you don't have to hit the database n times. Think of this like the best
	# compromise between the fast insertion of a linked list and the quick retrieval of an array
	def Layer.initialize_this_thing( params, layer_above_id, layer_below_id)
		# Step 1: figure out the stack number
		stack_up = 2147483648
		stack_down = -2147483648
		unless layer_above_id.nil? # FUCK YOU RUBY, THERE IS NO REASON WHY elseif IS SPELLED elsif
			@layer = Layer.find_by_id(layer_above_id)
			stack_up = @layer.stack_number unless @layer.nil?
		end
		unless layer_below_id.nil?
			@layer = Layer.find_by_id(layer_below_id)
			stack_down = @layer.stack_number unless @layer.nil?
		end 
		
		# Step 2: initialize the new layer
		stack_number = (stack_up/2 + stack_down/2).floor
		@layer = Layer.new( params.merge( :stack_number => stack_number ) )
			
			####IMPORTANT!!!###############################################
			# TODO: handle the reshuffling of everyone's stack_number after too much crap!  #
			##############################################################
	end
	 
end
