require 'get_or_build/version'
require 'get_or_build/association_builder'
require 'get_or_build/fields_for_builder'

ActiveRecord::Base.send :include, GetOrBuild::AssociationBuilder if defined?(ActiveRecord)
ActionView::Helpers::FormBuilder.send :include, GetOrBuild::FieldsForBuilder if defined?(ActionView)
