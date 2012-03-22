require 'test/unit'
require 'active_record'
require 'get_or_build'
Dir[File.expand_path('../models/*.rb', __FILE__)].each {|f| require f}

class TestHelper < Test::Unit::TestCase
  def setup
    ActiveRecord::Base.establish_connection(:adapter  => "sqlite3",
                                            :database => ":memory:")
    ActiveRecord::Base.connection.create_table(:companies) do |t|
      t.integer :location_id
      t.string  :name
    end
    ActiveRecord::Base.connection.create_table(:users) do |t|
      t.integer :company_id
      t.string  :name
    end
    ActiveRecord::Base.connection.create_table(:locations) do |t|
      t.string :address
    end
  end
end
