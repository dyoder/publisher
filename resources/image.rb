require 'waves/resources/file_mixin'

class Publisher::Resources::Image < Publisher::Resources::Default
  
  include Waves::Resources::FileMixin
  
  on( :get, :get => [ 'image', { :path => true } ] ) {
    path = captured.path.join('/') + request.extension
    load_dynamic( path ) || load_from_site( path ) || load_from_public( path ) || not_found
  }

  def load_dynamic( path )
    if image = model.find( path )
      image.path
    end
  end
  
  def load_from_site( path )
    load_from_file( "db/#{domain}/file/#{path}" )
  end

  def load_from_public( path )
    load_from_file( "public/images/#{path}" )
  end

  
end