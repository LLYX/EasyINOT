class Department < ActiveRecord::Base
    has_and_belongs_to_many :applications
    has_and_belongs_to_many :sites

	def self.search(search)
		if search
			where('english_name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |department|
	      csv << department.attributes.values_at(*column_names)
	    end
	  end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true, :encoding => 'windows-1252') do |row|
	    department = find_by_id(row["id"]) || new
	    department.attributes = row.to_hash
	    department.save!
	  end
	end
end
