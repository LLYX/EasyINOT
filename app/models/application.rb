class Application < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups

    def self.search(search)
		if search
			where('english_name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end
end
