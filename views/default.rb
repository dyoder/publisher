class Publisher::Views::Default < Hoshi::View[:html4_transitional]

  include Waves::Views::Mixin
  include Waves::ResponseMixin
  include Waves::Helpers::Basic
  include Waves::Helpers::Formatting
  include Publisher::ResponseMixin

  def initialize( request )
    @request = request; super
    [ singular, :default ].each { |mixin| site_mixin( mixin ) }
  end

  def site_mixin( name )
    file = :db / domain / :theme / name + '.rb'
    extend( eval( File.read( file ) ) ) if File.exist?( file )
  end

  def stylesheet( *paths )
    paths.each do |path|
      href = ( path =~ /^http/ ? path : "/css/#{path}.css" )
      link :rel => :stylesheet, :type => "text/css", :href => href
    end
  end

  # load javascript files
  def javascript( *paths )
    paths.each do |path|
      src = ( path =~ /^http/ ? path : "/javascript/#{path}.js" )
      script( :type => 'text/javascript', :lang => 'javascript', :src => src )
    end
  end

  def layout( content = nil, &block )
    content ||= site
    view(:layout).send( content.layout, content, &block )
  end

end
