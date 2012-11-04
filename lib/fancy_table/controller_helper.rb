# Do some of the heavy-lifting involved in building up a FancyTable
module FancyTable
  module ControllerHelper
    # objects - The Enumerable or ActiveRecord::Relation containing the objects
    #           to be rendered.
    # options - All optional for an ActiveRecord::Relation, but required for
    #           other Enumerables.
    #   :headers        - The columns which will be displayed in the table and
    #                     available as order options.
    #
    #                     Defaults to the column_names of `objects.model`
    #   :order_by       - The column by which the collection is to be sorted.
    #
    #                     Defaults to the first available option in
    #                     `sane_default_orders` or nil, which prevents sorting.
    #
    #                     This option has no effect when `objects` is not an
    #                     `ActiveRecord::Relation`.
    #   :actions        - The actions which will appear in the `<caption>` of
    #                     the `<table>`. These can be an array of symbols or
    #                     strings, which yield links to
    #                     [action]_[model_class]_path, or a hash in the format
    #                     `"Link text" => "/path/to/action"`.
    #
    #                     Defaults to [].
    #   :member_actions - The actions which will appear in the `<tr>` of the
    #                     `<table>` for each member.
    #
    #                     `member_actions` formats are identical to those for
    #                     `actions`.
    #
    #                     Defaults to [].
    #
    # * Define `fancy_table_headers`, which is used in the view partials to
    #   display the actual table header, build up sort links, and output fields
    #   into the table for each object.
    # * Define fancy_table_order, which is the column by which the orders are to
    #   be sorted.
    # * Define fancy_table_actions, which are the actions added to the
    #   `<caption>` of the `<table>`.
    # * Define fancy_table_member_actions, which are the actions added to each
    #   object's `<tr>` as links.
    #
    # Returns the modified objects variable, but the modifications are made
    # in-place, so you may not need to assign the value.
    def build_fancy_table(objects, options = {})
      define_fancy_table_title(objects)
      define_fancy_table_headers(objects, options[:headers])
      define_fancy_table_order(objects, options[:order_by])
      define_fancy_table_actions(objects, options[:actions])
      define_fancy_table_member_actions(objects, options[:member_actions])
      objects
    end

    private

    def define_fancy_table_title(objects)
      objects.define_singleton_method(:fancy_table_title) { '' }
    end

    def define_fancy_table_headers(objects, headers)
      headers ||= model_columns(objects)
      objects.define_singleton_method(:fancy_table_headers) { headers }
    end

    def define_fancy_table_order(objects, order_by)
      order_by ||= sanest_default_order(objects)
      objects.define_singleton_method(:fancy_table_order) { order_by }
    end

    def define_fancy_table_actions(objects, actions)
      actions ||= []
      objects.define_singleton_method(:fancy_table_actions) { actions }
    end

    def define_fancy_table_member_actions(objects, member_actions)
      member_actions ||= []
      objects.define_singleton_method(:fancy_table_member_actions) do
        member_actions
      end
    end

    def model_columns(objects)
      objects.model.column_names
    end

    def sanest_default_order(objects)
      (sane_default_orders & objects.fancy_table_headers).first
    end

    def sane_default_orders
      [:name, :title, :updated_at, :created_at, :id]
    end
  end
end
