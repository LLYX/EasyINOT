class Site < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups
    
    before_save :prepend_sitecode
    
    private
    def prepend_sitecode
        self.english_name = self.site_code + " " + self.english_name
        self.french_name = self.site_code + " " + self.french_name
    end
end
