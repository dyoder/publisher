class Publisher::Controllers::Default

  include Waves::Controllers::Mixin
  include Publisher::ResponseMixin

  def create; model.create( assign(query[ model_name ].to_h )) ; end
  def find( name ) ; model.find( name ) or not_found ; end
  def update( name )
    obj = find( name )
    obj.attributes = obj.attributes.merge( query[ model_name ].to_h )
    obj.save
  end
  def delete( name ) ; find( name ).delete ; end
  def assign( assigns )
    assigns[ :key ] ||= assigns['title'].downcase.gsub(/\s+/,'-').gsub(/[^\w\-]/,'')
    assigns[ :published ] ||= Time.now
    assigns
  end

end