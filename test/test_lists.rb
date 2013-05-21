# test_lists.rb
# 17. April 2007
#

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

begin
  require "rubygems"
  require "clothred"
rescue LoadError
  require "clothred"
end

require 'test/unit'

class TestClothRedLists < Test::Unit::TestCase
 
LISTS_TEST = [
    ["<ol>",""],
    ["</ol>","\n"],
    ["<li>","# "],
    ["</li>","\n"],
    ["<ul>",""],
    ["</ul>","\n"],
    ["<ol>\n<li>Item 1</li>\n<li>Item 2</li>\n<li>Item 3</li>\n</ol>\n", "\n# Item 1\n\n# Item 2\n\n# Item 3\n\n\n\n"],
    ["<ul>\n<li>Item 1</li>\n<li>Item 2</li>\n<li>Item 3</li>\n</ul>\n", "\n* Item 1\n\n* Item 2\n\n* Item 3\n\n\n\n"],
    ["<ol><li>Item 1</li><li>Item 2</li><li>Item 3</li></ol>", "# Item 1\n# Item 2\n# Item 3\n\n"],
    ["<ul><li>Item 1</li><li>Item 2</li><li>Item 3</li></ul>", "* Item 1\n* Item 2\n* Item 3\n\n"],
    [
      "<ol><li>Item 1</li><li>Item 2</li><li>Item 3</li></ol><ul><li>Item 1</li><li>Item 2</li><li>Item 3</li></ul>",
      "# Item 1\n# Item 2\n# Item 3\n\n* Item 1\n* Item 2\n* Item 3\n\n"
    ],
  ]
  
  def test_lists
    LISTS_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end