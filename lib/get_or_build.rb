require "get_or_build/version"

module GetOrBuild
  module AssociationBuilder
    # f.object.location_or_build
    def method_missing(method, *args)
      if method =~ /(\w+)_or_build$/
        if result = send($1, *args)
          result
        else
          builder_method = "build_#{$1}"
          send(builder_method, *args) if respond_to?(builder_method)
        end
      else
        super
      end
    end
  end
end

ActiveRecord::Base.send :include, GetOrBuild::AssociationBuilder if defined?(ActiveRecord)
