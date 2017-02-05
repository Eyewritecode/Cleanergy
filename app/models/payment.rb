class Payment < ActiveRecord::Base
	has_many :billings
end
