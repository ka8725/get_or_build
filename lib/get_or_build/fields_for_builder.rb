module GetOrBuild
  module FieldsForBuilder
    def self.included(base)
      base.class_eval do
        def fields_for_with_association_builder(record_name, record_object = nil, fields_options = {}, &block)
          fields_options, record_object = record_object, nil if record_object.is_a?(Hash) && record_object.extractable_options?

          if fields_options.delete(:build_association)
            association_name = case record_name
                               when String, Symbol
                                 record_name
                               when Array
                                  ActiveModel::Naming.param_key(record_name.last)
                               end
            build_method  = "build_#{association_name}"
            record_object = @object.send(build_method) if !record_object && !@object.send(association_name) && @object.respond_to?(build_method)
          end

          fields_for_without_association_builder(record_name, record_object, fields_options, &block)
        end

        alias_method_chain :fields_for, :association_builder
      end
    end
  end
end
