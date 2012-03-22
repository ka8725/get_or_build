require File.expand_path('../test_helper', __FILE__)

class ActiveRecordTest < TestHelper
  def test_with_new_record
    c = Company.new
    assert_not_nil c.location_or_build
    assert_not_nil c.user_or_build
  end

  def test_new_record_with_params
    c = Company.new
    assert_not_nil c.location_or_build(:address => 'Address'), 'Address'
    assert_not_nil c.user_or_build(:name => 'User'), 'User'
  end

  def test_with_persisted_record
    user = User.new(:name => 'Mister Duncan')
    location = Location.new(:address => 'Beverly Hills')
    c = Company.new(:user => user, :location => location)
    assert_equal c.user_or_build.name, user.name
    assert_equal c.location_or_build.address, location.address
  end

  def test_method_missing
    c = Company.new
    assert_raise NoMethodError do
      c.my_method
    end
  end
end
