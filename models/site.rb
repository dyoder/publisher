class Publisher::Models::Site < Publisher::Models::Default
  
  def self.roles
    @roles ||= %w( administrator member subscriber )
  end
  
  def self.[]( domain ) 
    Class.new( self ) do
      include( Filebase::Model[ :db / domain ] )
      associate( domain )
    end
  end
  
end
