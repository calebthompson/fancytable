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

    describe 'objects.fancy_table_headers' do
      it 'defaults to objects.column_names' do
        objects = []
        column_names = [:name, :status, :awesomeness_quotient]
        objects.stubs(model: mock(column_names: column_names))

        Controller.new.build_fancy_table(objects)

        objects.fancy_table_headers.should eq(column_names)
      end
    end
  end
end
