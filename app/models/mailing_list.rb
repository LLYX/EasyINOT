class MailingList < ActiveRecord::Base

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end

	def self.to_csv(options = {})
	  (CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |mailing_list|
	      csv << mailing_list.attributes.values_at(*column_names)
	    end
	  end).encode('windows-1252', :undef => :replace, :replace => '')
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true, :encoding => 'windows-1252') do |row|
	    mailing_list = find_by_id(row["id"]) || new
	    mailing_list.attributes = row.to_hash
	    mailing_list.save!
	  end
	end
end
