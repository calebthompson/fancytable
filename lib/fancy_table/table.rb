require 'action_view'

class FancyTable::Table
  def initialize(objects)
    @objects = objects
  end

  def build
    action_view.render('fancy_table/table', objects: @objects)
  end

  private

  def action_view
    ActionView::Base.new('app/views/', {})
  end
end
