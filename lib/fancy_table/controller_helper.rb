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
    def build_fancy_table(objects)
      define_fancy_table_headers(objects)
      objects
    end

    private

    def define_fancy_table_headers(objects)
      objects.define_singleton_method(:fancy_table_headers) {
        model.column_names }
    end

    def model_columns(objects)
      objects.model.column_names
    end
  end
end
