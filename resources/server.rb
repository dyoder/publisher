class Publisher::Resources::Server 
      
  include Waves::Resources::Mixin
  include Publisher::ResponseMixin
  
  on( true ) { to( :story ) }
  on( :get, [ 'css', :name ] ) { 
    view(:css).send( captured.name )
  }
  
end