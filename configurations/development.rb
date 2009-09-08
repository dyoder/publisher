module Publisher
  module Configurations
    class Development < Default
      database :adapter => 'sqlite', :database => 'db/development'
    end
  end
end
