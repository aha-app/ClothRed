$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require "clothred"
require 'test/unit'

class TestClothRedLinks < Test::Unit::TestCase

  LINKS_TESTS = [
    ["<a href=\"http://www.rallydev.com\">http://www.rallydev.com</a>", "[http://www.rallydev.com]"],
    ["<a href=\"http://www.rallydev.com\">Rally Software Development Corp</a>", "[Rally Software Development Corp|http://www.rallydev.com]"],
    ["<a class=\"mce-item-anchor\" title=\"\" contenteditable=\"false\" name=\"bigheading\"></a>", ''],
    ["<a class=\"mce-item-anchor\" title=\"\" contenteditable=\"false\" name=\"smallheading\"></a>", '']
  ]

  def test_lists
    LINKS_TESTS.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end
