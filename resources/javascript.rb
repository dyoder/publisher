require 'waves/resources/file_mixin'

class Publisher::Resources::Javascript < Publisher::Resources::Default
  
  include Waves::Resources::FileMixin
      
  on( :get, :javascript => [ 'javascript', { :path => true } ] ) do
    response.content_type = 'text/javascript'
    path = captured.path.join('/') + request.extension
    load_from_site( path ) || load_from_public( path ) || not_found
  end
  
  def load_from_site( path )
    load_from_file( "db/#{domain}/theme/#{path}" )
  end
  
  def load_from_public( path )
    load_from_file( "public/javascript/#{path}" )
  end

end