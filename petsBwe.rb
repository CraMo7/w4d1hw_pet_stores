require("sinatra")
require("sinatra/contrib/all") if development?
require_relative("./models/store.rb")
require_relative("./models/pet.rb")