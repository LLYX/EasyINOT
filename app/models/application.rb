class Application < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups

    def departments_string
    	departments_string = self.departments.map { |d| d.english_name }.join(',')

    	return departments_string
    end

    def groups_string
    	groups_string = self.groups.map { |g| g.english_name }.join(',')

    	return groups_string
    end

    def self.search(search)
		if search
			where('english_name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end

	def self.to_csv(options = {})
	  (CSV.generate(options) do |csv|
	    csv << ["id", "english_name", "french_name", "critical", "departments", "groups"]
	    all.each do |application|
	      csv << [application.id, application.english_name, application.french_name, application.critical, 
	      	application.departments.map { |d| d.english_name }.join(','), application.groups.map { |g| g.english_name }.join(',')]
	    end
	  end).encode('windows-1252', :undef => :replace, :replace => '')
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true, :encoding => 'windows-1252') do |row|
	    application = find_by_id(row["id"]) || new
	    application.attributes = row.to_hash.slice('english_name', 'french_name', 'critical')
	    application.departments = !row['departments'].nil? ? Department.where(english_name: row['departments'].split(',')) : Department.where(enlgish_name: '')
	    application.groups = !row['groups'].nil? ? Group.where(english_name: row['groups'].split(',')) : Group.where(english_name: '')
	    application.save!
	  end
	end
end
