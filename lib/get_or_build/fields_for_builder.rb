module GetOrBuild
  module FieldsForBuilder
    def self.included(base)
      base.class_eval do
        def fields_for_with_association_builder(record_name, record_object = nil, fields_options = {}, &block)
          fields_options, record_object = record_object, nil if record_object.is_a?(Hash) && record_object.extractable_options?

          if fields_options[:build_association] && @object.respond_to?("build_#{record_name}") && !record_object
            record_object = @object.send("build_#{record_name}")
          end

          fields_for_without_association_builder(record_name, record_object, fields_options, &block)
        end

        alias_method_chain :fields_for, :association_builder
      end
    end
  end
end
