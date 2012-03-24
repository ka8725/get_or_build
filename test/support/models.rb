class Company < ActiveRecord::Base
  belongs_to :location
  has_one :user
end

class User < ActiveRecord::Base
  belongs_to :company
end

class Location < ActiveRecord::Base; end
