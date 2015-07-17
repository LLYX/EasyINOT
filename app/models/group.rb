class Group < ActiveRecord::Base
    has_and_belongs_to_many :applications
    has_and_belongs_to_many :sites
end
