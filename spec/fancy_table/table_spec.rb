require 'spec_helper'

describe FancyTable::Table do
  describe 'build' do
    let(:table) { FancyTable::Table.new(fake_objects).build }
    it 'builds a fancy table' do
      table.should have_css('table.fancy-table')
    end

    it 'builds a caption' do
      table.should have_css('table.fancy-table caption')
    end

    it 'puts fancy_table_title in the caption' do
      doc = Nokogiri::HTML(table)

      doc.css('caption').text.should include(fake_objects.fancy_table_title)
    end

    it 'builds a thead' do
      table.should have_css('table.fancy-table thead')
    end

    it 'builds a th for each header in the thead' do
      doc = Nokogiri::HTML(table)
      fake_objects.fancy_table_headers.map{ |h| h.to_s.titleize }.each do |header|
        doc.css('thead th').text.should include(header)
      end
    end
  end
end

def fake_objects
  @objects ||= -> do
    objects = []
    objects.stubs(fancy_table_title: 'Objects')
    objects.stubs(fancy_table_headers: [:foo, :bar, :baz])
    objects
  end.call
end
