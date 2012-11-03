module FancyTable
  module ActionController
    module FancyTableMethods
      def build_fancy_table(objects)
        objects.define_singleton_method(:fancy_table_headers) { objects.model.column_names }
      end
    end
  end
end
