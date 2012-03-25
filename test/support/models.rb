class Company < ActiveRecord::Base
  belongs_to :location
  has_one :user
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :location
end

class User < ActiveRecord::Base
  belongs_to :company
  accepts_nested_attributes_for :company
end

class Location < ActiveRecord::Base; end
