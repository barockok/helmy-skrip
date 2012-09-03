class Setoran < ActiveRecord::Base
  attr_accessible :actor_id, :amount, :nasabah_id, :term
  belongs_to :nasabah
  belongs_to :actor , :class_name => 'User', :foreign_key => 'actor_id'
end
