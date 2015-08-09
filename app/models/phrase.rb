class Phrase < ActiveRecord::Base

	def self.search(search)
		if search
			where('english_phrase LIKE ?', "%#{search}%")
	  	else
	    	all
	  	end
	end

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |phrase|
	      csv << phrase.attributes.values_at(*column_names)
	    end
	  end
	end

	def self.import(file)
	  CSV.foreach(file.path, headers: true, :encoding => 'windows-1252') do |row|
	    phrase = find_by_id(row["id"]) || new
	    phrase.attributes = row.to_hash
	    phrase.save!
	  end
	end
end
