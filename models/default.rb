require 'filebase/drivers/yaml'
Filebase.storage = Filebase::Drivers::YAML

class Publisher::Models::Default

  include Publisher::ResponseMixin

  def self.[]( domain )
    Class.new( self ) do
      include( Filebase::Model[ :db / domain / superclass.basename.snake_case ] )
      associate( domain )
    end
  end

  def self.associate( domain ) ; end

  def name ; get( :key ) ; end

end