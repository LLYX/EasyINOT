class Incident < ActiveRecord::Base
    before_save :auto_fill
    
    def affected_departments_french
        affected_departments_french = self.affected_departments.gsub(/\r\n?/, "\n").split("\n")

        affected_departments_french.length.times do |i|
           affected_departments_french[i] = Department.exists?(english_name: affected_departments_french[i]) ? Department.where(english_name: affected_departments_french[i]).take.french_name : affected_departments_french[i]
        end

        affected_departments_french = affected_departments_french.join("\n")

        return affected_departments_french
    end

    def service_impact_french
        service_impact_french = self.service_impact.gsub(/\r\n?/, "\n").split("\n")

        service_impact_french.length.times do |i|  
            if Application.exists?(english_name: service_impact_french[i])
                service_impact_french[i] = Application.where(english_name:  service_impact_french[i]).take.french_name
            elsif Site.exists?(english_name:  service_impact_french[i])
                service_impact_french[i] = Site.where(english_name:  service_impact_french[i]).take.french_name
            else
                service_impact_french[i] =  service_impact_french[i]
            end
        end

        service_impact_french = service_impact_french.join("\n")

        return service_impact_french
    end

    def responsible_service_support_resource_group_french
        responsible_service_support_resource_group_french = self.responsible_service_support_resource_group.gsub(/\r\n?/, "\n").split("\n")

        responsible_service_support_resource_group_french.length.times do |i|
           responsible_service_support_resource_group_french[i] = Group.exists?(english_name: responsible_service_support_resource_group_french[i]) ? Group.where(english_name: responsible_service_support_resource_group_french[i]).take.french_name : responsible_service_support_resource_group_french[i]
        end

        responsible_service_support_resource_group_french = responsible_service_support_resource_group_french.join("\n")

        return responsible_service_support_resource_group_french
    end

    def incident_responsibility_french
        incident_responsibility_french = self.incident_responsibility.gsub(/\r\n?/, "\n").split("\n")

        incident_responsibility_french.length.times do |i|
           incident_responsibility_french[i] = Department.exists?(english_name: incident_responsibility_french[i]) ? Department.where(english_name: incident_responsibility_french[i]).take.french_name : incident_responsibility_french[i]
        end

        incident_responsibility_french = incident_responsibility_french.join("\n")

        return incident_responsibility_french
    end

    private

    # Fetch the associated departments and support groups of an application/site and fill them into the incident
    # automatically.
    
    def auto_fill 
        if self.service_impact != ""

            impacted = self.service_impact.gsub(/\r\n?/, "\n").split("\n")
            impacted.length.times do |i|
              if Application.exists?(english_name: impacted[i])
                impacted[i] = Application.where(english_name: impacted[i]).take
              elsif Site.exists?(english_name: impacted[i])
                impacted[i] = Site.where(english_name: impacted[i]).take
              else
                impacted[i] = impacted[i]
              end
            end

            #@application = Application.exists?(english_name: self.service_impact) ? Application.where(english_name: self.service_impact).take : Site.where(english_name: self.service_impact).take
            if self.affected_departments == ""
                departments = []
                impacted.each do |application|
                    application.departments.each do |department|
                        departments.append(department)
                    end
                end
                departments_string = ""
                departments.each do |d|
                    if !departments_string.include?(d.english_name)
                        departments_string+= d.english_name + "\n"
                    end
                end
                self.affected_departments = departments_string
            end

            if self.responsible_service_support_resource_group == ""
                groups = []
                impacted.each do |application|
                    application.groups.each do |group|
                        groups.append(group)
                    end
                end
                groups_string = ""
                groups.each do |g|
                    if !groups_string.include?(g.english_name)
                        groups_string+= g.english_name + "\n"
                    end
                end
                self.responsible_service_support_resource_group = groups_string
            end
        end
    end

    def self.search(search)
        if search
            where('incident_number LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
