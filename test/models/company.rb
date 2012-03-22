class Company < ActiveRecord::Base
  belongs_to :location
  has_one :user
end
