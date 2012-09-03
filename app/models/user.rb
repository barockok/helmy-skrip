class User < ActiveRecord::Base
  attr_accessible :jabatan, :nama_lengkap, :password, :role_type, :username
end
