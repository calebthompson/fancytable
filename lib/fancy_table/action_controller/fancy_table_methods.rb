module FancyTable
  module ActionController
    module FancyTableMethods
      def build_fancy_table(objects)
        objects.define_singleton_method(:fancy_table_headers) { true }
      end
    end
  end
end
