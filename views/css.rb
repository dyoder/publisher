require 'waves/views/cassy'
class Publisher::Views::Css < Cassy
  
  include Waves::Views::Mixin
  
  def initialize( request )
    @request = request; super
    file = :db / domain / :theme / 'css.rb'
    extend( eval( File.read( file ) ) ) if File.exist?( file ) 
  end
  
  def default
    body {
      font_family 'sans-serif'
      width '800px'
      margin '20px auto'
    }
  end
  
end