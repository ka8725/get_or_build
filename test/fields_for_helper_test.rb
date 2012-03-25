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
        assert_not_nil ff.text_field(:name)
      end
    end
  end

  def test_fields_for_should_receive_build_association_param2
    company = Company.new
    assert_equal company.user, nil
    form_for company, :url => '' do |f|
      f.fields_for :user, :build_association => false do |ff|
        assert_equal nil, ff.object
        assert_equal nil, ff.text_field(:name)
      end
      f.fields_for :user do |ff|
        assert_equal nil, ff.object
        assert_equal nil, ff.text_field(:name)
      end
    end
  end

  def test_for_existing_record1
    company = Company.new
    user = company.build_user(:name => 'Mister Proper')
    form_for company, :url => '' do |f|
      f.fields_for :user, :build_association => true do |ff|
        assert_not_nil ff.text_field(:name)
      end
    end
  end

  def test_for_existing_record2
    company = Company.new
    user = company.build_user(:name => 'Mister Proper')
    form_for company, :url => '' do |f|
      f.fields_for :user do |ff|
        assert_not_nil ff.text_field(:name)
      end
    end
  end

  def test_nested_params
    company = Company.new
    user = company.build_user(:name => 'New User')
    form_for company, :url => '' do |f|
      f.fields_for [:admin, user], :build_association => true do |ff|
        assert_not_nil ff.object
        assert_equal user.name, ff.object.name
      end
    end
  end
end
