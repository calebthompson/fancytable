require 'spec_helper'

describe FancyTable::ActionController::FancyTableMethods do
  before do
    class Controller
      include FancyTable::ActionController::FancyTableMethods
    end
  end

  describe '#build_fancy_table' do
    it 'defines fancy_table_headers on objects' do
      objects = []

      Controller.new.build_fancy_table(objects)

      objects.should respond_to(:fancy_table_headers)
    end
  end
end
