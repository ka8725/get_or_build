module GetOrBuild
  module AssociationBuilder
    # This is ghost method which generates methods like: "association_name_or_build", for example:
    # class User < ActiveRecord::Base
    #   belongs_to :company
    # end
    #
    # u = User.new
    # u.company           # => nil
    # u.company_or_build  # => #<Company:0x007fe7218be420>
    # Here the method `company_or_build` for `User` instane `u` was generated
    def method_missing(method, *args)
      if method =~ /(\w+)_or_build$/
        if result = send($1, *args)                                       # if result = send("company", *args)
          result                                                          #   result
        else                                                              # else
          builder_method = "build_#{$1}"                                  #   builder_method = "build_company"
          send(builder_method, *args) if respond_to?(builder_method)      #   send(builder_method, *args) if respond_to?(builder_method)
        end                                                               # end
      else
        super
      end
    end
  end
end
