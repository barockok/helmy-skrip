class NasabahStatus < ActiveRecord::Base
  attr_accessible :keterangan, :nasabah_id, :status , :actor_id
  belongs_to :nasabah
  belongs_to :actor , :class_name => 'User', :foreign_key => 'actor_id'
end
