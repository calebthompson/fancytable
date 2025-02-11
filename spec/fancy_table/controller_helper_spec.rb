require 'spec_helper'

describe FancyTable::ControllerHelper do
  describe '#build_fancy_table additions to the collection' do
    it 'defines useful methods on objects' do
      column_names = [:name, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.should respond_to(:fancy_table_title)
      objects.should respond_to(:fancy_table_order)
      objects.should respond_to(:fancy_table_headers)
      objects.should respond_to(:fancy_table_actions)
      objects.should respond_to(:fancy_table_member_actions)
    end
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
    it 'uses :order_by option if passed' do
      column_names = [:name, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects,
        order_by: :awesomeness_quotient,
        headers: :column_names
      )

      objects.fancy_table_order.should == :awesomeness_quotient
    end

    it 'defaults to :name if available' do
      column_names = [:name, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :name
    end

    it 'defaults to :title if available' do
      column_names = [:title, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :title
    end

    it 'defaults to :created_at if available' do
      column_names = [:created_at, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :created_at
    end

    it 'defaults to :updated_at if available' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :updated_at
    end

    it 'defaults to :id if available' do
      column_names = [:id, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :id
    end

    it 'defaults to :name before all other defaults' do
      column_names = [:id, :updated_at, :created_at, :title, :name]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_order.should == :name
    end
  end

  describe 'objects.fancy_table_actions' do
    it 'defaults to an empty array (no actions)' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_actions.should == []
    end

    it 'uses :actions for :fancy_table_actions when available' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      actions = [:new]
      objects = []

      FancyTable.build_fancy_table(objects,
        headers: column_names,
        actions: actions
      )

      objects.fancy_table_actions.should == actions
    end

    it 'accepts a hash for :actions' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      actions = { 'New' => '/new' }
      objects = []

      FancyTable.build_fancy_table(objects,
        headers: column_names,
        actions: actions
      )

      objects.fancy_table_actions.should == actions
    end
  end

  describe 'objects.fancy_table_member_actions' do
    it 'defaults to an empty array (no member_actions)' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      objects = []

      FancyTable.build_fancy_table(objects, headers: column_names)

      objects.fancy_table_member_actions.should == []
    end

    it 'uses :member_actions for :fancy_table_member_actions when available' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      member_actions = [:edit]
      objects = []

      FancyTable.build_fancy_table(objects,
        headers: column_names,
        member_actions: member_actions
      )

      objects.fancy_table_member_actions.should == member_actions
    end

    it 'accepts a hash for :member_actions' do
      column_names = [:updated_at, :status, :awesomeness_quotient]
      member_actions = { 'Edit' => '/new' }
      objects = []

      FancyTable.build_fancy_table(objects,
        headers: column_names,
        member_actions: member_actions
      )

      objects.fancy_table_member_actions.should == member_actions
    end
  end
end
