require 'spec_helper'

describe FancyTable::ControllerHelper do
  describe '#build_fancy_table additions to the collection' do
    describe 'objects.fancy_table_headers' do
      it 'defaults to objects.column_names' do
        column_names = [:name, :status, :awesomeness_quotient]
        model = mock(column_names: column_names)
        objects = mock(model: model)

        FancyTable.build_fancy_table(objects)

        objects.fancy_table_headers.should == column_names
      end

      it 'uses :headers option if passed' do
        column_names = [:position, :location]
        objects = []

        FancyTable.build_fancy_table(objects, headers: column_names)

        objects.fancy_table_headers.should == column_names
      end
    end
  end

  describe 'objects.fancy_table_order' do
    it 'defines #fancy_table_order on objects' do
      column_names = [:name, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.should respond_to(:fancy_table_order)
    end

    it 'uses :order_by option if passed' do
      column_names = [:name, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects,
        order_by: :awesomeness_quotient,
        headers: :column_names
      )

      objects.fancy_table_order.should == :awesomeness_quotient
    end
  end
end
