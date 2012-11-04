require 'spec_helper'

describe FancyTable::ControllerHelper do
  describe '#build_fancy_table' do
    describe 'objects.fancy_table_headers' do
      it 'defaults to objects.column_names' do
        column_names = [:name, :status, :awesomeness_quotient]
        model = mock(column_names: column_names)
        objects = mock(model: model)

        FancyTable.build_fancy_table(objects)

        objects.fancy_table_headers.should eq(column_names)
      end

      it 'uses :headers option if passed' do
        column_names = [:position, :location]
        objects = []

        FancyTable.build_fancy_table(objects, headers: column_names)

        objects.fancy_table_headers.should eq(column_names)
      end
    end
  end
end
