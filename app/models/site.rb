class Site < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups
    
    before_save :prepend_sitecode
    
    private
    def prepend_sitecode
        self.english_name = self.site_code + " " + self.english_name
        self.french_name = self.site_code + " " + self.french_name
    end

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
        all.each do |site|
          csv << site.attributes.values_at(*column_names)
        end
      end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true) do |row|
        site = find_by_id(row["id"]) || new
        site.attributes = row.to_hash
        site.save!
      end
    end
end
