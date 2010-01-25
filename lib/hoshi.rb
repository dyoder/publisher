# We're monkey-patching hoshi temporarily until the next version ...

require 'hoshi'
class Hoshi::View
  def self.self_closing_tags *names
    names.map { |n| tag n, :self }
  end
end

class Hoshi::View::HTML4Transitional
  tags *%w(a address applet area b base basefont bdo blockquote body
       button caption center col colgroup dd div dl dt fieldset font
       form frame frameset h1 h2 h3 h4 h5 h6 head hr html iframe
       input isindex label legend li map noframes noscript
       object ol optgroup option p param pre q script select span
       style table tbody textarea tfoot thead title tr td ul nobr)
  open_tags *%w(br)
  self_closing_tags *%w(img meta link)
end
