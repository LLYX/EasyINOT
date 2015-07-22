class Incident < ActiveRecord::Base
    before_save :auto_fill
    
    private
    def auto_fill 
        if self.service_impact != ""
            @application = Application.exists?(english_name: self.service_impact) ? Application.where(english_name: self.service_impact).take : Site.where(english_name: self.service_impact).take
            if self.affected_departments == ""
                @departments = @application.departments
                @departments_string = ""
                @departments.each do |d|
                    @departments_string += d.english_name + "\n"
                end
                self.affected_departments = @departments_string
            end
            if self.responsible_service_support_resource_group == ""
                @groups = @application.groups
                @groups_string = ""
                @groups.each do |g|
                    @groups_string = g.english_name + "\n"
                end
                self.responsible_service_support_resource_group = @groups_string
            end
        end
    end
end
