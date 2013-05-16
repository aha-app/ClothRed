$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require "clothred"
require 'test/unit'

class TestClothRedImageLinks < Test::Unit::TestCase

  IMAGE_LINKS_TESTS = [
    ["<img src=\"","!"], ["\" alt=\"\" />","!"],
    ["<img src=\"http://www.host.com/image.gif\" alt=\"\" />", "!http://www.host.com/image.gif!"],
    ["<img src=\"attached-image.gif\" alt=\"\" />", "!attached-image.gif!"],
    ["<img src=\"image.jpg|thumbnail\" alt=\"\" />", "!image.jpg|thumbnail!"],
    ["!image.gif|align=right, vspace=4!", "!image.gif|align=right, vspace=4!"]
  ]

  def test_lists
    IMAGE_LINKS_TESTS.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end