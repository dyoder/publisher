module Publisher
  module Configurations
    class Production < Default
      database :host => 'localhost', :adapter => 'mysql', 
        :database => 'publisher',
        :user => 'root', :password => ''
      reloadable []
      log :level => :error,
        :output => ( :log / "waves.#{$$}" ),
        :rotation => :weekly
      host '0.0.0.0'
      port 80
    end
  end
end
