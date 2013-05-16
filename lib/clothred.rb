=begin rdoc
Provides the methods to convert HTML into Textile.
*Please* *note*: ClothRed creates UTF-8 output. To do so, it sets $KCODE to UTF-8. This will be globally available!
TODO: enhance docs, as more methods come available

Author:: Phillip "CynicalRyan" Gawlowski (mailto:cmdjackryan@gmail.com)
Copyright:: Copyright (c) 2007 Phillip Gawlowski
License:: BSD
=end

require 'cgi'

class ClothRed < String

  TEXT_FORMATTING = [
    ["<b>", "**"], ["</b>","**"], ["<em>","_"], ["</em>", "_"], ["<b>", "*"],
    ["</b>", "*"], ["<cite>", "??"], ["</cite>", "??"],
    ["<code>", "{{"], ["</code>", "}}"],
    ["<del>", "-"], ["</del>", "-"], ["<ins>", "+"],
    ["</ins>", "+"], ["<sup>","^"], ["</sup>","^"], ["<sub>","~"], ["</sub>","~"],
    ["<strong>", "*"], ["</strong>", "*"], ["<i>","__"], ["</i>", "__"],
  ]

  HEADINGS = [
    ["<h1>","h1. "], ["</h1>", "\n\n"], ["<h2>","h2. "], ["</h2>", "\n\n"],
    ["<h3>","h3. "], ["</h3>", "\n\n"], ["<h4>","h4. "], ["</h4>", "\n\n"],
    ["<h5>","h5. "], ["</h5>", "\n\n"], ["<h6>","h6. "], ["</h6>", "\n\n"],
    ["<h7>","h7. "], ["</h7>", "\n\n"]
  ]

  STRUCTURES = [
    ["<p>", ""],["</p>","\n\n"], ["<blockquote>", "bq. "], ["</blockquote>",""],
    ["<br />", "\n"], ["<br>", "\n"]
  ]

  ENTITIES = [
    ["&#8220;", '"'], ["&#8221;", '"'], ["&#8212;", "--"], ["&#8212;", "--"],
    ["&#8211;","-"], ["&#8230;", "..."], ["&#215;", " x "], ["&#8482;","(TM)"],
    ["&#174;","(R)"], ["&#169;","(C)"], ["&#8217;", "'"]
  ]

  TABLES = [
    ["<table>",""], ["</table>",""], ["<tr>",""], ["</tr>","|\n"], ["<td>","|"],
    ["</td>",""], ["<th>", "|_."], ["</th>", ""]
  ]

  LISTS = [
    ["<ol>",""], ["</ol>","\n"], ["<li>","* "], ["</li>","\n"], ["<ul>",""], ["</ul>","\n"],
  ]

  IMAGE_LINKS = [
    ["<img src=\"","!"], ["\" alt=\"\" />","!"],
  ]

  # <a href=\"http://www.rallydev.com\">http://www.rallydev.com</a>           [http://www.rallydev.com]
  # <a href=\"http://www.rallydev.com\">Rally Software Development Corp</a>   [Rally Software Development Corp|http://www.rallydev.com]
  LINKS = [
    [/<a href=".*">((mailto|https?):.*?)<\/a>/, '[\1]'],
    [/<a href="(.*?)">(.*?)<\/a>/, '[\2|\1]'],
  ]

  def initialize (html)
    super(html)
    @workingcopy = html
  end

  #Call all necessary methods to convert a string of HTML into Textile markup.

  def to_textile
    headings(@workingcopy)
    structure(@workingcopy)
    text_formatting(@workingcopy)
    entities(@workingcopy)
    tables(@workingcopy)
    lists(@workingcopy)
    image_links(@workingcopy)
    links(@workingcopy)
    @workingcopy = CGI::unescapeHTML(@workingcopy)
    @workingcopy
  end

  #The conversion methods themselves are private.
  private

  def text_formatting(text)
    TEXT_FORMATTING.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def headings(text)
    HEADINGS.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def entities(text)
    ENTITIES.each do |htmlentity, textileentity|
      text.gsub!(htmlentity, textileentity)
    end
    text
  end

  def structure(text)
    STRUCTURES.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def tables(text)
    TABLES.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def lists(text)
    LISTS.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def image_links(text)
    IMAGE_LINKS.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def links(text)
    LINKS.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end

  def css_styles(text)
    #TODO: Translate CSS-styles
    text
  end

end