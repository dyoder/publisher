module Publisher::ResponseMixin
  def domain() ; request.domain.sub(/^www\./,'').downcase ; end
  def site() ; Publisher::Models::Site[ domain ].find( :site ) ; end
  def model( name = nil ) ; name ||= singular ; app::Models[ name ][ domain ]; end
  def find( m, n ); model( m ).find(n) ; end
  def all( m ) ; model(m).all ; end
end