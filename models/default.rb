require 'filebase/drivers/yaml'
Filebase.storage = Filebase::Drivers::YAML

class Publisher::Models::Default

  include Publisher::ResponseMixin

  class << self ; attr_accessor :domain ; end

  def self.[]( domain )
    Class.new( self ) do
      include( Filebase::Model[ :db / domain / superclass.basename.snake_case ] )
      @domain = domain
    end
  end

  # override these from the response mixin
  def app ; Publisher ; end
  def domain ; self.class.domain ; end

  def name ; get( :key ) ; end

  def tags
    case tags = get(:tags)
    when Array then tags
    when String then tags.split(',').map(&:strip)
    else []
    end
  end

end
