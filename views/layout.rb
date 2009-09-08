class Publisher::Views::Layout < Publisher::Views::Default
  
  include Waves::Views::Mixin
  include Waves::ResponseMixin
  include Waves::Helpers::Formatting
  include Publisher::ResponseMixin
  
  def default( content )
    doctype
    html {
      head { 
        stylesheet( content.stylesheet )
        title content.title
      }
      body { yield }
    }
  end
  
end

