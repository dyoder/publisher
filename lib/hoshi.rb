# We're monkey-patching hoshi temporarily until the next version ...

require 'hoshi'
class Hoshi::View
  # A short-hand for creating multiple tags that are self-closing.
  def self.closed_tags *names
    names.map { |n| tag n, :self }
  end
end

class Hoshi::View::HTML4Transitional < Hoshi::View::HTML
  dtd! "<DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 " \
    "Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"
  tags *%w(a address applet area b base basefont bdo blockquote body
       button caption center col colgroup dd div dl dt fieldset font
       form frame frameset h1 h2 h3 h4 h5 h6 head hr html iframe img
       input isindex label legend li map meta noframes noscript
       object ol optgroup option p param pre q script select span
       style table tbody textarea tfoot thead title tr td ul nobr)
  open_tags *%w(br)
  closed_tags *%w(link)
end
