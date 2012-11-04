# Do some of the heavy-lifting involved in building up a FancyTable
module FancyTable
  module ControllerHelper
    # objects - The Array or ActiveRecord::Relation containing the objects to
    #           be rendered.
    #
    # Define fancy_table_headers, which is used in the view partials to
    # display the actual table header, build up sort links, and output fields
    # into the table for each object.
    #
    # Returns the modified objects variable, but the modifications are made
    # in-place, so you may not need to assign the value.
    def build_fancy_table(objects, options = {})
      define_fancy_table_headers(objects, options[:headers])
      define_fancy_table_order(objects, options[:order_by])
      objects
    end

    private

    def define_fancy_table_order(objects, order_by)
      order_by ||= nil
      objects.define_singleton_method(:fancy_table_order) { order_by }
    end

    def define_fancy_table_headers(objects, headers)
      headers ||= model_columns(objects)
      objects.define_singleton_method(:fancy_table_headers) { headers }
    end

    def model_columns(objects)
      objects.model.column_names
    end
  end
end
