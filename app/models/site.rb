class Site < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups
    
    before_save :prepend_sitecode
    
    def departments_string
      departments_string = self.departments.map { |d| d.english_name }.join(',')
      
      return departments_string
    end

    def groups_string
      groups_string = self.groups.map { |g| g.english_name }.join(',')

      return groups_string
    end
    
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
        csv << ["id", "site_code", "english_name", "french_name", "designated", "departments", "groups"]
        all.each do |site|
          csv << [site.id, site.site_code, site.english_name, site.french_name, site.designated, 
            site.departments.map { |d| d.english_name }.join(','), site.groups.map { |g| g.english_name }.join(',')]
        end
      end
    end

    def self.import(file)
      CSV.foreach(file.path, headers: true, :encoding => 'windows-1252') do |row|
        site = find_by_id(row["id"]) || new
        site.attributes = row.to_hash.slice('site_code', 'english_name', 'french_name', 'designated')
        site.departments = Department.where(english_name: row['departments'])
        site.groups = Group.where(english_name: row['groups'])
        site.save!
      end
    end
end
