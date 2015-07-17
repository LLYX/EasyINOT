class Site < ActiveRecord::Base
    has_and_belongs_to_many :departments
    has_and_belongs_to_many :groups
end
