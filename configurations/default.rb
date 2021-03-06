module Publisher
  module Configurations
    class Default  < Waves::Configurations::Default      
      resource Publisher::Resources::Server
      reloadable [ Publisher ]
      host '127.0.0.1' ; port 3000 ; log :level => :debug
      use Rack::Session::Pool, :expire_after => 1.day
      dispatcher ::Waves::Dispatchers::Default
      server Waves::Servers::Mongrel
      dependencies []
    end
  end
end