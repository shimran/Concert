ENV['RACK_ENV'] = 'test'
require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + "/../lib/*.rb"].each { |file| require file }
  RSpec.configure do |config|
    config.after(:each) do
      Venue.all().each() do |question|
        question.destroy()
      end
    end
    config.after(:each) do
      Band.all().each() do |survey|
        survey.destroy()
      end
    end
  end
