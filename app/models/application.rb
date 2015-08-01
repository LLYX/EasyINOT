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

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |application|
	      csv << application.attributes.values_at(*column_names)
	    end
	  end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true, :encoding => 'windows-1251:utf-8') do |row|
	    application = find_by_id(row["id"]) || new
	    application.attributes = row.to_hash
	    application.save!
	  end
	end
end
