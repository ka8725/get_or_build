require 'test_helper'
require 'action_view'

class FieldsFor < ActionView::TestCase
  include Support::ActiveRecordConnection

  def test_fields_for_should_receive_build_association_param1
    company = Company.new
    assert_equal company.user, nil
    form_for company, :url => '' do |f|
      f.fields_for :user, :build_association => true do |ff|
        assert_not_nil ff.object
      end
    end
  end

  def test_fields_for_should_receive_build_association_param2
    company = Company.new
    assert_equal company.user, nil
    form_for company, :url => '' do |f|
      f.fields_for :user, :build_association => false do |ff|
        assert_equal ff.object, nil
      end
      f.fields_for :user do |ff|
        assert_equal ff.object, nil
      end
    end
  end
end
