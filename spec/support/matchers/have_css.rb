require 'nokogiri'

def have_css(selector)
  HasCss.new(selector)
end

class HasCss
  def initialize(selector)
    @selector = selector
  end

  def matches?(target)
    @target = target
    document.css(@selector).any?
  end

  def failure_message
    "expected\n#@target\nto have css selector:\n#@selector."
  end

  def negative_failure_message
    "didn't expect\n#@target\nto have css selector:\n#@selector"
  end

  private

  def document
    Nokogiri::HTML(@target)
  end
end
