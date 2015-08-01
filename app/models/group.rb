class Group < ActiveRecord::Base
    has_and_belongs_to_many :applications
    has_and_belongs_to_many :sites

    def self.search(search)
		if search
			where('english_name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end
end
