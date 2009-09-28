require 'waves/resources/file_mixin'

class Publisher::Resources::Css < Publisher::Resources::Default
    
  include Waves::Resources::FileMixin
  
  on( :get, [ 'css', { :path => true } ] ) { 
    response.content_type = 'text/css'
    path = captured.path.join('/') + request.extension
    load_dynamic || load_from_site( path ) || load_from_public( path ) || not_found
  }
  
  def load_dynamic
    if captured.path.length == 1
      name = captured.path.first
      view.send( name ) if view.respond_to?( name )
    end
  end
  
  def load_from_site( path )
    load_from_file( "db/#{domain}/theme/#{path}" )
  end
  
  def load_from_public( path )
    load_from_file( "public/css/#{path}" )
  end
  
end