require 'spec_helper'

describe FancyTable::ControllerHelper do
  describe '#build_fancy_table' do
    it 'defines fancy_table_headers on objects' do
      objects = []

      FancyTable.build_fancy_table(objects)

      objects.should respond_to(:fancy_table_headers)
    end

    describe 'objects.fancy_table_headers' do
      it 'defaults to objects.column_names' do
        column_names = [:name, :status, :awesomeness_quotient]
        model = mock(column_names: column_names)
        objects = mock(model: model)

        FancyTable.build_fancy_table(objects)

        objects.fancy_table_headers.should eq(column_names)
      end
    end
  end
end
