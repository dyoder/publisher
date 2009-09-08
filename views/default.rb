class Publisher::Views::Default < Hoshi::View[:html4_transitional]
  
  include Waves::Views::Mixin
  include Waves::ResponseMixin
  include Waves::Helpers::Formatting
  include Publisher::ResponseMixin
  
  def initialize( request )
    @request = request; super
    file = :db / domain / :theme / singular + '.rb'
    extend( eval( File.read( file ) ) ) if File.exist?( file ) 
  end
    
  def stylesheet( name = 'default' )
    link :rel => :stylesheet, :href => "/css/#{name}.css", :type => "text/css"
  end
    
  def layout( content = nil, &block )
    content ||= site
    view(:layout).send( content.layout, content, &block )
  end
  
end